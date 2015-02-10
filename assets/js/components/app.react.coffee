React = require 'react'
Router = require 'react-router'
Header = require './header.react'
Cx = require 'react/lib/cx'
hasFeature = require '../utils/feature-test'

RouteHandler = React.createFactory Router.RouteHandler
R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Application Frame'
  render: ->
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

