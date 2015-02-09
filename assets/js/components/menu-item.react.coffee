React = require 'react'
Router = require 'react-router'
Cx = require 'react/lib/cx'

Link = React.createFactory Router.Link

module.exports = React.createFactory React.createClass
  displayName: 'Menu Item'
  propTypes:
    path: React.PropTypes.string.isRequired
    label: React.PropTypes.string.isRequired
  render: ->
    React.DOM.li
      className: Cx
        'menu-item': true
        'menu-parent': @props.children?
    ,
      Link to: @props.path, @props.label
      @props.children
