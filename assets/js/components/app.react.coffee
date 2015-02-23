React = require 'react'
Router = require 'react-router'
Cx = require 'react/lib/cx'
hasFeature = require '../utils/feature-test'

RouteHandler = React.createFactory Router.RouteHandler
R = React.DOM
div = R.div

Header = null

module.exports = React.createFactory React.createClass
  displayName: 'Application Frame'
  render: ->
    Header ?= require './header.react'
    div
      className: Cx
        'frame': true
        'touch-events': hasFeature 'touchEvents'
        'can-hover': not hasFeature 'touchEvents'
        'svg': hasFeature 'svg'
    ,
      Header()
      div className: 'main',
        RouteHandler()

