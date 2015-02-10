React = require 'react'
Location = require './location.react'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Dealers'
  render: ->
    div className: 'dealers-page',
      R.h2 null, 'Find a dealer near you'

      Location()
