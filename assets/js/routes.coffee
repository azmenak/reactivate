Router = require 'react-router'
React = require 'react'
App = require './components/app.react'

Home      = require './components/home'
Lifestyle = require './components/lifestyle/'
Products  = require './components/products/'
Sublime   = require './components/products/sublime'
Dealers   = require './components/dealers/'
Contact   = require './components/contact/'
Ee        = require './components/ee/'
Testimonials = require './components/testimonials/'
Gallery   = require './components/gallery/'

Route =  React.createFactory Router.Route
DefaultRoute =  React.createFactory Router.DefaultRoute

routes = Route name: 'app', handler: App, path: '/',
  Route name: 'lifestyle', handler: Lifestyle, path: '/Lifestyle/?'
  Route name: 'products', handler: Products, path: '/products/?'
  Route name: 'sublime', handler: Sublime, path: '/sublime/?'
  Route name: 'dealers', handler: Dealers, path: '/dealers/?'
  Route name: 'contact', handler: Contact, path: '/contact/?'
  Route name: 'ee', handler: Ee, path: '/ee/?'
  Route name: 'testimonials', handler: Testimonials, path: '/testimonials/?'
  Route name: 'gallery', handler: Gallery, path: '/gallery/?'
  DefaultRoute handler: Home

module.exports = routes
