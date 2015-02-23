React     = require 'react'
Slideshow = require '../slideshow'
data      = require '../../data'

R         = React.DOM
div       = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Gallery Slideshow'

  galleryData: ->
    data.gallery[@props.gallery]

  slides: ->
    for i in [1..@galleryData().count]
      background:
        "/img/gallery/#{@props.gallery}/export/\
        #{@props.gallery}-#{i}-medium@2x.jpg"

  filmstrip: ->
    for i in [1..@galleryData().count]
      "/img/gallery/#{@props.gallery}/export/\
      #{@props.gallery}-#{i}-small-swatch@2x.jpg"

  render: ->
    div className: 'collection',
      R.h3 null, @props.name or @galleryData().name
      div className: 'slideshow-box',
        Slideshow
          slides: @slides()
          filmstrip: @filmstrip()
          id: @props.gallery
          showControls: true
          autoplay: false
        , @props.children

