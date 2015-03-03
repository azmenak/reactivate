gulp        = require 'gulp'
$           = require('gulp-load-plugins')()
browserSync = require 'browser-sync'
reload      = browserSync.reload
Q           = require 'q'

createSets  = require 'cli/create-sets'
renderHTML  = require 'cli/render-static-html'

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
    .pipe $.rev()
    .pipe gulp.dest("#{assets}/css")
    .pipe $.rev.manifest
      base: assets
      merge: true
      path: "#{out}/manifest.json"
    .pipe gulp.dest(out)

gulp.task 'html', (cb) ->
  promise = renderHTML(out)
  promise.all().then ->
    reload()

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
    .pipe $.rev()
    .pipe gulp.dest("#{assets}/js")
    .pipe $.rev.manifest
      base: assets
      merge: true
      path: "#{out}/manifest.json"
    .pipe gulp.dest(out)

gulp.task 'imgs', ['imgmake'], ->
  gulp.src ['assets/img/**/export/**/*', 'assets/img/*']
    .pipe gulp.dest("#{assets}/img")

gulp.task 'imgmake', (cb) ->
  if '--imgmake' in userArgs
    sets =
      sublime: 'productSet'
      gallery: 'gallerySet'
      stock: 'stockSet'
    promises = for key, val of sets
      createSets key, val
    Q.all(promises)
  else if '--sublime' in userArgs
    createSets('sublime', 'productSet')
  else
    cb()

gulp.task 'extras', ->
  gulp.src ['CNAME']
    .pipe gulp.dest("#{out}")
  gulp.src ['assets/extras/**/*']
    .pipe gulp.dest("#{out}/extras")
  gulp.src ['assets/fonts/**/*']
    .pipe gulp.dest("#{out}/fonts")

gulp.task 'clean', (cb) ->
  if '--skip-clean' in userArgs then cb()
  else
    del = require 'del'
    del ["#{out}/**/*"], cb

gulp.task 'serve', ['build-assets'], ->
  browserSync
    notify: DEV
    port: 9000
    server:
      baseDir: [out]

  gulp.watch([
    assets+'/img/**/*'
    assets+'/js/**/*'
  ]).on 'change', reload

  gulp.watch '*.jade', ['html']
  gulp.watch 'assets/css/**/*.styl', ['styles']
  gulp.watch 'assets/js/**/*', ['js', 'html']
  gulp.watch 'assets/img/**/*', ['imgs']


gulp.task 'build-assets', (cb) ->
  seq = require 'run-sequence'
  seq 'clean',
    ['styles', 'imgs', 'js', 'extras'],
    'html',
    'build',
    cb

gulp.task 'build', ->
  gulp.src "#{out}/**/*"
    .pipe $.size(title: 'Build', gzip: 'True')

gulp.task 'deploy', ['build-assets'], (cb)->
  ghPages = require 'gh-pages'
  path = require 'path'
  ghPages.publish path.join(__dirname, 'build'), cb
