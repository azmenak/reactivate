gulp        = require 'gulp'
$           = require('gulp-load-plugins')()
browserSync = require 'browser-sync'
reload      = browserSync.reload

src         = "#{__dirname}/assets"
out         = "#{__dirname}/build"
assets      = out

PROD = if process.env.NODE_ENV is 'production' then true else false
DEV = -> not PROD

userArgs = process.argv.slice 2

gulp.task 'styles', ->
  autoprefixer = require 'autoprefixer-core'
  processors = [
    autoprefixer(browsers: ['last 2 versions'])
  ]
  if PROD
    mqpacker = require 'css-mqpacker'
    csswring  = require 'csswring'
    processors.push mqpacker
    processors.push csswring

  axis      = require 'axis'
  bootstrap = require 'bootstrap-styl'

  gulp.src 'assets/css/master.styl'
    .pipe $.if(DEV, $.sourcemaps.init())
    .pipe $.stylus(use: [bootstrap(), axis()])
    .pipe $.postcss(processors)
    .pipe $.if(DEV, $.sourcemaps.write())
    .pipe gulp.dest("#{assets}/css")
    .pipe reload(stream: true)

gulp.task 'html', ->
  gulp.src '', read: false
    .pipe $.shell(['reactivate'])

gulp.task 'js', ->
  gulp.src 'assets/js/main.coffee', read: false
    .pipe $.browserify
      transform: ['coffeeify']
      extensions: ['.coffee']
      debug: DEV
    .pipe $.if PROD, $.uglify
      compress:
        drop_console: true
        dead_code: true
      screw_ie8: true
    .pipe $.rename('build.js')
    .pipe gulp.dest("#{assets}/js")

gulp.task 'imgs', ['imgmake'], ->
  gulp.src ['assets/img/**/export/**/*', 'assets/img/*']
    .pipe gulp.dest("#{assets}/img")

gulp.task 'imgmake', ->
  gulp.src '', read: false
    .pipe $.if(!'--skip-imgmake' of userArgs,
      $.shell(['imagemake --all']))

gulp.task 'extras', ->
  gulp.src 'CNAME'
    .pipe gulp.dest("#{out}")

gulp.task 'clean', ->
  del = require 'del'
  del [out]

gulp.task 'serve', ->
  browserSync
    notify: DEV
    port: 9000
    server:
      baseDir: [out, '.tmp']

  gulp.watch([
    out+'/**/*.html'
    assets+'/img/**/*'
    assets+'/js/**/*'
  ]).on 'change', reload

  gulp.watch '*.jade', ['html']
  gulp.watch 'assets/css/**/*.styl', ['styles']
  gulp.watch 'assets/js/**/*', ['js', 'html']
  gulp.watch 'assets/img/**/*', ['imgs']

gulp.task 'build', ['clean', 'html', 'styles', 'imgs', 'js'], ->
  gulp.src "#{out}/**/*"
    .pipe $.size(title: 'Build', gzip: 'True')

gulp.task 'deploy', ['clean', 'html', 'imgs', 'styles', 'js', 'extras'], (cb)->
  ghPages = require 'gh-pages'
  path = require 'path'
  ghPages.publish path.join(__dirname, 'build'), cb
