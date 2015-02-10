React = require 'react'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Gallery'

  render: ->
    div className: 'gallery-page',
      R.h2 null, 'Gallery'
