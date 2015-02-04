Router = require 'react-router'
React = require 'react'
App = require './components/app.react'

Home      = require './components/home'
Lifestyle = require './components/lifestyle/'
Products  = require './components/products/'
Sublime   = require './components/products/sublime'
Dealers   = require './components/dealers/'

Route =  React.createFactory Router.Route
DefaultRoute =  React.createFactory Router.DefaultRoute

routes = Route name: 'app', handler: App, path: '/',
  Route name: 'lifestyle', handler: Lifestyle
  Route name: 'products', handler: Products
  Route name: 'sublime', handler: Sublime, path: '/sublime/'
  Route name: 'dealers', handler: Dealers
  DefaultRoute handler: Home

module.exports = routes
