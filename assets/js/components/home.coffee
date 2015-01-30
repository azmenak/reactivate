React = require 'react'
data = require '../data'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Home'
  render: ->
    div null,
      R.h2 className: 'test', 'sup'
      R.p className: 'lifestyle',
        data.pages.home.copy.lifestyle
