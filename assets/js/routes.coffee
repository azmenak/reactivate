Router = require 'react-router'
React = require 'react'
Test = require './components/test'

Route =  React.createFactory Router.Route
DefaultRoute =  React.createFactory Router.DefaultRoute
RouteHandler =  React.createFactory Router.RouteHandler

R = React.DOM
div = R.div

App = React.createClass
  displayName: 'Application Frame'
  render: ->
    div className: 'frame',
      R.header className: 'main-header',
        R.h1 null, 'HEADER'

      RouteHandler()

routes = Route
  handler: App
,
  Route path: '/', handler: Test
  DefaultRoute handler: Test

module.exports = routes
