renderRetinaSet = require './render-retina-set'
mkdirp          = require 'mkdirp'
fs              = require 'fs'
filters         = require './filters'
IMAGES          = require '../assets/js/data/images'
SIZES           = require '../assets/js/data/sizes'

module.exports = (setName, imgSet) ->
  sets = fs.readdirSync("./assets/img/#{setName}")
    .filter filters.osFileTest
    .reduce (prev, curr) ->
      if filters.imgTest curr
        prev['.'] ?= []
        prev['.'].push curr
      else
        prev[curr] =
          fs.readdirSync("./assets/img/#{setName}/#{curr}")
            .filter filters.imgTest
      prev
    , {}
  for set, files of sets
    mkdirp.sync "./assets/img/#{setName}/#{set}/export"
    for f in files
      key = f.replace /(\.jpe?g)$/, ''
      for size in IMAGES[imgSet]
        info = SIZES[size]
        path = "./assets/img/#{setName}/#{set}/#{f}"
        renderRetinaSet key, size, info, path
