React = require 'react'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Slideshow'

  propTypes:
    key: React.PropTypes.string.isRequired
    slides: React.PropTypes.array.isRequired

  getInitialState: ->
    currentSlide: 0

  render: ->
    div className: 'slideshow', id: "slideshow-#{@props.key}",
      div className: 'slides',
        for slide in @props.slides
          div className: 'slide'
