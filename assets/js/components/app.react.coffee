React = require 'react'
Router = require 'react-router'
Header = require './header.react'

RouteHandler = React.createFactory Router.RouteHandler
R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Application Frame'
  render: ->
    div className: 'frame',
      Header()
      div className: 'main',
        RouteHandler()

