React = require 'react'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Testimonials'

  render: ->
    div className: 'testimonials-page',
      R.h2 null, 'Testimonials'
