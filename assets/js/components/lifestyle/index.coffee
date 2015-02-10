React = require 'react'
Slideshow = require '../slideshow'
data = require '../../data'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Lifestyle'

  render: ->
    div className: 'page-lifestyle',
      R.h2 null, data.pages.lifestyle.copy.headline
      div className: 'slideshow-box',
        Slideshow
          slides: data.pages.lifestyle.slides
          id: 'lifestyle'
          showControls: true
          autoplay: false
