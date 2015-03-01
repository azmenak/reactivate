React = require 'react'

module.exports = React.createFactory React.createClass
  displayName: 'Retina Image'

  isRetina: ->
    window.devicePixelRatio >= 1.5

  getImgUrl: ->
    retina = if @isRetina() then '@2x' else ''
    if (@props.path)
      @props.path.replace /(?:(@2x)?(\..+))$/, "#{retina}$2"
    else
      ext = @props.ext or '.jpg'
      "/img/#{@props.set}/export/#{@props.img}-#{@props.size}#{retina}#{ext}"

  altText: ->
    @props.alt or
      @props.img or
       @props.path.split('/')[-1..]

  render: ->
    imgProps =
      src: @getImgUrl()
      alt: @altText()
      className: (@props.className or '') + ' retina-img'
    (imgprops[key] = val) for key, val of @props when \
      key not in ['src','alt','path','ext','set','img','size']

    React.DOM.img imgProps
