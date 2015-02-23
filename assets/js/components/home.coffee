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
      R.h1 null, copy.headline
      div className: 'slideshow-box',
        Slideshow
          slides: data.pages.home.slides
          id: 'home'
          showControls: true

      #div className: 'home-grid',
        #div className: 'home-grid-left',
          #R.p className: 'lifestyle', copy.lifestyle
        #div className: 'home-grid-right',
          #R.p className: 'installation-spotlight', 'install spotlight'
