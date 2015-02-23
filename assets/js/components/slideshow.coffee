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
    filmstrip: React.PropTypes.array
    transitionTime: React.PropTypes.number
    showControls: React.PropTypes.bool
    autoplay: React.PropTypes.bool

  getDefaultProps: ->
    transitionTime: 6000
    showControls: false
    autoplay: true
    filmstrip: []

  getInitialState: -> @resetState()

  resetState: ->
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

  goTo: (i) ->
    l = @props.slides.length
    return unless l > 1
    current = i
    if l is 2
      [next,prev] = [-i+1,-i+1]
    else
      prev = if i-1 >= 0 then i-1 else l-1
      next = if i+1 <= l-1 then i+1 else 0

    @setState {current, next, prev}, @resetTick

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
  componentWillReceiveProps: ->
    @setState @resetState()

  render: ->
    div className: 'slideshow', id: "slideshow-#{@props.id}",
      slides:
        div className: 'slides', ref: 'slides',
          images:
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
            if @props.showControls and @props.slides.length > 1
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
      filmstrip:
        if @props.filmstrip.length > 1
          div className: 'filmstrip',
            for f,i in @props.filmstrip
              R.img
                className: Cx
                  'active': i is @state.current
                key: f
                src: f
                alt: "#{i}-filmstrip"
                onClick: @goTo.bind @, i
      children: @props.children
