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
    transitionTime: React.PropTypes.number

  getDefaultProps: ->
    transitionTime: 6000

  getInitialState: ->
    [next, prev] = switch l=@props.slides.length
      when 0, 1
        [null, null]
      when 2
        [1,1]
      when 3
        [1,2]
      else
        [1, l-1]
    {current: 0, next, prev}

  next: ->
    l = @props.slides.length
    return unless l > 1
    next = if @state.next+1 <= l-1 then @state.next+1 else 0
    current = @state.next
    prev = @state.current
    @setState {current, next, prev}

  prev: ->
    l = @props.slides.length
    return unless l > 1
    prev = if @state.prev-1 >= 0 then @state.prev-1 else l-1
    current = @state.prev
    next = @state.current
    @setState {current, next, prev}

  keydown: (e) ->
    return if /input|textarea/i.test e.target.tagName
    return unless @isMounted()
    @resetTick()
    key = e.keyCode or e.which
    switch key
      when KEYS.LEFT then @prev()
      when KEYS.RIGHT then @next()

  tick: ->
    return unless @isMounted()
    @next()

  resetTick: ->
    clearInterval @interval
    @interval = setInterval @tick, @props.transitionTime

  componentDidMount: ->
    window.addEventListener 'keydown', @keydown
    @interval = setInterval @tick, @props.transitionTime
  componentDidUnmount: ->
    window.removeEventListener 'keydown', @keydown
    clearInterval @interval

  render: ->
    div className: 'slideshow', id: "slideshow-#{@props.id}",
      div className: 'slides', ref: 'slides',
        for slide, i in @props.slides
          div
            className: Cx
              'slide': true
              'active': i is @state.current
              'prev': i is @state.prev
              'next': i is @state.next
            key: "slide-#{i}"
          ,
            R.img
              src: slide.background
              alt: slide.headline or "Slideshow slide #{i}"
