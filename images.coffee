#! /usr/bin/env coffee
userArgs = process.argv.slice(2)
fs = require 'fs'
lwip = require 'lwip'
mkdirp = require 'mkdirp'

SIZES = require './assets/js/data/sizes'

console.time 'total time'

# Zip an object from the data in Sublime set
sublimeSet = require('./assets/js/data/sublime').reduce (prev, curr) ->
  prev[curr.images.key] = curr.images.set; prev
, {}
# Filter out folders and non-image files
sublimeImgFiles = fs.readdirSync('./assets/img/sublime').filter (file) ->
  /// (
    \. (jpe?g)
    |  (png)
    |  (gif)
  )$ ///.test file
mkdirp.sync './assets/img/sublime/export'

for f in sublimeImgFiles
  key = f.replace /(\.jpe?g)$/, ''
  do (f, key) ->
    if sublimeSet.hasOwnProperty key
      for size in sublimeSet[key]
        info = SIZES[size]
        do (size, info) ->
          lwip.open "./assets/img/sublime/#{f}", (err, img) ->
            hwRatio = img.height() / img.width()

            # Resize based on width given
            if info.width? and not info.height?
              width = info.width
              height = width * hwRatio

            # Resize based on height given
            else if not info.width? and info.height?
              height = info.height
              width = height * (1/hwRatio)

            # Resize and crop image
            else
              height = info.height
              width = info.width

            img.clone (err, img) ->
              console.time "#{key}:#{size} image resize @2x"
              img.batch()
                .cover width*2, height*2
                .writeFile "./assets/img/sublime/export/#{key}-#{size}@2x.jpg",
                  (err) ->
                    console.log err if err
                    console.timeEnd "#{key}:#{size} image resize @2x"

            console.time "#{key}:#{size} image resize"
            img.batch()
              .cover width, height
              .writeFile "./assets/img/sublime/export/#{key}-#{size}.jpg",
                (err) ->
                  console.log err if err
                  console.timeEnd "#{key}:#{size} image resize"

      console.log 'Set found for ', key
    else
      console.log 'No set found for: ', key
