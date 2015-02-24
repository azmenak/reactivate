Router       = require 'react-router'
React        = require 'react'
App          = require './components/app.react'

Home         = require './components/home'
Lifestyle    = require './components/lifestyle/'
Products     = require './components/products/'
Sublime      = require './components/products/sublime'
Dealers      = require './components/dealers/'
Contact      = require './components/contact/'
Ee           = require './components/ee/'
Testimonials = require './components/testimonials/'
Gallery      = require './components/gallery/'
Spotlight    = require './components/gallery/spotlight'
Collection   = require './components/gallery/collection'

Route        = React.createFactory Router.Route
DefaultRoute = React.createFactory Router.DefaultRoute

data = require './data'

routes = Route name: 'home', handler: App, path: '/', order: 0,
  DefaultRoute handler: Home
  Route
    name: 'lifestyle'
    handler: Lifestyle
    path: '/lifestyle/?'
    order: 1
  Route
    name: 'products'
    handler: Products
    path: '/products/?'
  Route
    name: 'sublime'
    handler: Sublime
    path: '/sublime/?'
    order: 3
  Route
    name: 'expressive essentials'
    handler: Ee
    path: '/ee/?'
  Route
    name: 'where to buy'
    handler: Dealers
    path: '/dealers/?'
    order: 5
  Route
    name: 'testimonials'
    handler: Testimonials
    path: '/testimonials/?'
    order: 6
  Route
    name: 'contact'
    handler: Contact
    path: '/contact/?'
    order: 8
  Route
    name: 'gallery'
    handler: Gallery
    path: '/gallery/?'
    order: 7
  , do ->
    collections = for key, val of data.gallery
      Route
        name: val.name.toLowerCase()
        path: "/gallery/#{key}/?"
        key: key
        handler: Collection
    collections.push DefaultRoute handler: Spotlight, key: 'gallery-default'
    collections

module.exports = routes
