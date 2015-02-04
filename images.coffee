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
            if info.width? and not info.height?
              width = info.width
              height = width * hwRatio
            else if not info.width? and info.height?
              height = info.height
              width = height * (1/hwRatio)
            else
              height = info.height
              width = info.width
            img.clone (err, img) ->
              console.time "#{size} image resize @2x"
              bitch = img.batch()
              if info.crop?
                [cropWidth, cropHeight] =
                  if info.crop.width? and not info.crop.height?
                    #cratio = height / info.crop.width
                    #if cratio > hwRatio then height = info.crop.width * cratio
                    [info.crop.width*2, height*2]
                  else if not info.crop.width? and info.crop.height?
                    #cratio = info.crop.height / width
                    #if cratio < hwRatio then width = width * (1/cratio)
                    [width*2, info.crop.height*2]
                  else
                    [info.crop.width*2, info.crop.height*2]
              bitch.resize width*2, height*2
              bitch.crop cropWidth, cropHeight if info.crop?
              bitch
                .writeFile "./assets/img/sublime/export/#{key}-#{size}@2x.jpg",
                  (err) ->
                    console.log if err then err
                    else "Wrote #{key}-#{size}"
                    console.timeEnd "#{size} image resize @2x"

            console.time 'image resize'
            bitch = img.batch()
            bitch.resize width, height
            if info.crop?
              if info.crop.width? and not info.crop.height?
                bitch.crop info.crop.width, height
              else if not info.crop.width? and info.crop.height?
                bitch.crop width, info.crop.height
              else
                bitch.crop info.crop.width, info.crop.height
            bitch
              .writeFile "./assets/img/sublime/export/#{key}-#{size}.jpg",
                (err) ->
                  console.log if err then err
                  else "Wrote #{key}-#{size}"
                  console.timeEnd 'image resize'

      console.log 'Set found for ', key
    else
      console.log 'No set found for: ', key
