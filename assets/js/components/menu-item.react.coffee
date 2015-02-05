React = require 'react'
Router = require 'react-router'

Link = React.createFactory Router.Link

module.exports = React.createFactory React.createClass
  displayName: 'Menu Item'
  propTypes:
    path: React.PropTypes.string.isRequired
  render: ->
    React.DOM.li className: 'menu-item',
      Link to: @props.path,
        @props.children
