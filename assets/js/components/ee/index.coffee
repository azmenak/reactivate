React = require 'react'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'EE'

  render: ->
    div className: 'ee-page',
      R.h2 null, 'Expressive Essentials'
