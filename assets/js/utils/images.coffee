sublime = require('../data/sublime')

data = [].concat sublime

ReactivateImage = (imgKey) ->
  @key = imgKey

Object.defineProperty ReactivateImage.prototype, 'images',
  get: ->
    "/img/sublime/exports/"
