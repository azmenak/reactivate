React = require 'react'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Contact'

  render: ->
    div className: 'contact-page',
      R.h2 null, 'Contact Us'
