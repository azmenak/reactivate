React = require 'react'
Cx = require 'react/lib/cx'
KEYS = require '../utils/keys'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Slideshow'

  propTypes:
    id: React.PropTypes.string.isRequired
    slides: React.PropTypes.array.isRequired

  getInitialState: ->
    currentSlide: 0

  keydown: (e) ->
    return if /input|textarea/i.test e.target.tagName
    key = e.keyCode or e.which
    switch key
      when KEYS.LEFT then @prev()
      when KEYS.RIGHT then @next()

  render: ->
    div className: 'slideshow', id: "slideshow-#{@props.id}",
      div className: 'slides',
        for slide, i in @props.slides
          div
            className: Cx
              'slide': true
              'active': i is 0
          ,
            R.img
              src: slide.background
              alt: slide.headline or "Slideshow slide #{i}"
