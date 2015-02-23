React = require 'react'
GallerySlideshow = require './gallery-slideshow'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Spotlight Collection'

  render: ->
    div className: 'spotlight',
      GallerySlideshow
        name: 'Spotlight Collection'
        gallery: 'mohawk-house'
