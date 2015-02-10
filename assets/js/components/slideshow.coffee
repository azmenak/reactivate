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
    showControls: React.PropTypes.bool
    autoplay: React.PropTypes.bool

  getDefaultProps: ->
    transitionTime: 6000
    showControls: false
    autoplay: true

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
    @setState {current, next, prev}, @resetTick

  prev: ->
    l = @props.slides.length
    return unless l > 1
    prev = if @state.prev-1 >= 0 then @state.prev-1 else l-1
    current = @state.prev
    next = @state.current
    @setState {current, next, prev}, @resetTick

  keydown: (e) ->
    return if /input|textarea/i.test e.target.tagName
    return unless @isMounted()
    key = e.keyCode or e.which
    switch key
      when KEYS.LEFT then @prev()
      when KEYS.RIGHT then @next()

  tick: ->
    return unless @isMounted()
    @next()

  resetTick: ->
    return unless @props.autoplay
    clearTimeout @timeout
    @timeout = setTimeout @tick, @props.transitionTime

  componentDidMount: ->
    window.addEventListener 'keydown', @keydown
    @resetTick()
  componentDidUnmount: ->
    window.removeEventListener 'keydown', @keydown
    clearTimeout @timeout

  render: ->
    div className: 'slideshow', id: "slideshow-#{@props.id}",
      slides: div className: 'slides', ref: 'slides',
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
      controls:
        if @props.showControls
          div className: 'controls',
            div
              className: 'left-control control'
              onClick: @prev
            ,
              R.i className: 'fa fa-angle-left'
            div
              className: 'right-control control'
              onClick: @next
            ,
              R.i className: 'fa fa-angle-right'
