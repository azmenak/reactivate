React = require 'react'
Slideshow = require './slideshow'
data = require '../data'

R = React.DOM
div = R.div

copy = data.pages.home.copy

module.exports = React.createFactory React.createClass
  displayName: 'Home'
  render: ->
    div className: 'home-page',
      div className: 'slideshow-box',
        Slideshow
          slides: data.pages.home.slides
          id: 'home'
          showControls: true
      R.p className: 'lifestyle', copy.lifestyle
