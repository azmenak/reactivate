React = require 'react'
Router = require 'react-router'
routes = require('./assets/js/routes')

data = require './assets/js/data'

#global = Function('return this')() or (42; eval)('this')
#global.data ?= data

reactify = (path) ->
  res = null
  Router.run routes, path, (fn) ->
    Handler = React.createFactory fn
    res = React.renderToString Handler()
  return res

module.exports = reactify
