axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
browserify   = require 'roots-browserify'
css_pipeline = require 'css-pipeline'

React     = require 'react'
Reactify  = require './reactify'
data      = require './assets/js/data'

module.exports =
  ignores: ['README.md', '**/layout.*', '**/_*', '.gitignore', 'ship.*conf'
            'reactify.coffee', 'data.coffee', 'routes.coffee',
            'assets/js/components/**/*']

  extensions: [
    browserify
      files: 'assets/js/main.coffee'
      out: 'js/build.js'
      sourceMap: true
    css_pipeline
      files: 'assets/css/*.styl'
      out: '/css/style.css'
  ]

  stylus:
    use: [axis(), rupture(), autoprefixer()]
    sourcemap: true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true

  server:
    clean_urls: true

  locals: {Reactify, React, data}
