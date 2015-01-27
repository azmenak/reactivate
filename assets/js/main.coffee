console.log 'hello there!'

React = require 'react'
Router = require 'react-router'

routes = require('./routes')

Router.run routes, Router.HistoryLocation, (fn) ->
  Handler = React.createFactory fn
  React.render Handler(), document.body
