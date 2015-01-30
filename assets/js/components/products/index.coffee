data = require '../../data'
React = require 'react'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Products'

  render: ->
    div className: 'products-page',
      R.h2 null, 'Products Page'
