Router = require 'react-router'
React = require 'react'
App = require './components/app.react'
Test = require './components/test'

Route =  React.createFactory Router.Route
DefaultRoute =  React.createFactory Router.DefaultRoute

routes = Route
  handler: App
,
  Route path: '/', handler: Test
  DefaultRoute handler: Test

module.exports = routes
