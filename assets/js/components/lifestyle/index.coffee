React = require 'react'
data = require '../../data'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Lifestyle'

  render: ->
    div className: 'page-lifestyle',
      R.h2 null, 'URBANIA: its a lifestyle'
