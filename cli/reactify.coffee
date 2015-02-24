React  = require 'react'
Router = require 'react-router'
routes = require 'app/routes'

reactify = (path) ->
  res = null
  Router.run routes, path, (fn) ->
    Handler = React.createFactory fn
    res = React.renderToString Handler()
  return res

module.exports = reactify
