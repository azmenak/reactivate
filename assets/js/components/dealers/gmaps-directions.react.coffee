React = require 'react'

module.exports = React.createFactory React.createClass
  displayName: 'Google Maps Directions Link'

  propTypes:
    saddr: React.PropTypes.string.isRequired
    daddr: React.PropTypes.string.isRequired
    label: React.PropTypes.string

  getHref: ->
    base = 'http://maps.google.com/maps'
    "#{base}?saddr=#{@props.saddr}&daddr=#{@props.daddr}"

  render: ->
    React.DOM.a
      href: @getHref()
      target: '_blank'
    , @props.label or 'Open directions in Google Maps'
