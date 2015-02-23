React     = require 'react'
Router    = require 'react-router'
Slideshow = require '../slideshow'
GallerySlideshow = require './gallery-slideshow'
data      = require '../../data'

State     = Router.State
R         = React.DOM
div       = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Collection'

  mixins: [State]

  key: ->
    @getPath().split('/').pop()

  render: ->
    div className: 'collection',
      GallerySlideshow
        gallery: @key()

