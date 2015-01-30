Router = require 'react-router'
React = require 'react'
App = require './components/app.react'
Home = require './components/home'
Lifestyle = require './components/lifestyle/'
Products = require './components/products/'
Dealers = require './components/dealers/'

Route =  React.createFactory Router.Route
DefaultRoute =  React.createFactory Router.DefaultRoute

routes = Route
  handler: App
,
  Route path: '/', handler: Home
  Route path: '/lifestyle', handler: Lifestyle
  Route path: '/products', handler: Products
  Route path: '/dealers', handler: Dealers
  DefaultRoute handler: Home

module.exports = routes
