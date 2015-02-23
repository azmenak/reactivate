#! /usr/bin/env coffee
console.time 'TOTAL TIME'
process.on 'exit', (code) ->
  console.log '\n'
  console.timeEnd 'TOTAL TIME'

userArgs = process.argv.slice(2)

fs              = require 'fs'
mkdirp          = require 'mkdirp'
renderRetinaSet = require './cli/render-retina-set'
createSets      = require './cli/create-sets'
filters         = require './cli/filters'
IMAGES          = require './assets/js/data/images'
SIZES           = require './assets/js/data/sizes'

if '--sublime' in userArgs
  # Zip an object from the data in Sublime set
  sublimeSet = require('./assets/js/data/sublime').reduce (prev, curr) ->
    prev[curr.images.key] = curr.images.set; prev
  , {}
  # Filter out folders and non-image files
  sublimeImgFiles =
    fs.readdirSync('./assets/img/sublime').filter filters.imgTest
  mkdirp.sync './assets/img/sublime/export'
  for f in sublimeImgFiles
    key = f.replace /(\.jpe?g)$/, ''
    if sublimeSet.hasOwnProperty key
      for size in sublimeSet[key]
        info = SIZES[size]
        path = "./assets/img/sublime/#{f}"
        renderRetinaSet key, size, info, path
      console.log 'Set found for ', key
    else
      console.log 'No set found for: ', key

if '--gallery' in userArgs
  createSets 'gallery', 'gallerySet'

if '--stock' in userArgs
  createSets 'stock', 'stockSet'
