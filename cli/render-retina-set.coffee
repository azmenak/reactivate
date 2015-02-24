Q     = require 'q'
lwip  = require 'lwip'

module.exports = (key, size, info, path, outpath) ->
  if outpath?
    # ensure ends with '/'
    outpath += '/' unless outpath[-1..] is '/'
  else
    outpath = path.split('/')[...-1].concat('export').join('/') + '/'

  smallDeferred = Q.defer().promise
  largeDeferred = Q.defer().promise

  lwip.open path, (err, img) ->
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
    else if not info.width? and not info.height?
      height = img.height()
      width = img.width()
    else
      height = info.height
      width = info.width

    img.clone (err, img) ->
      console.time "#{key}:#{size}"
      batch = img.batch()
      if info.blur?
        batch.blur info.blur
        batch.lighten 0.5
      batch.cover width*2, height*2
        .writeFile "#{outpath}#{key}-#{size}@2x.jpg", 'jpg', quality: 50,
          (err) ->
            console.log err if err
            console.timeEnd "#{key}:#{size}"
            largeDeferred.resolve()
    console.time "#{key}:#{size}"
    batch = img.batch()
    if info.blur?
      batch.blur info.blur
      batch.lighten 0.5
    batch.cover width, height
      .writeFile "#{outpath}#{key}-#{size}.jpg", 'jpg', quality: 50,
        (err) ->
          console.log err if err
          console.timeEnd "#{key}:#{size}"
          smallDeferred.resolve()

  Q.all [smallDeferred, largeDeferred]
