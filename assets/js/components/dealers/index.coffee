React = require 'react'
Location = require './location.react'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Dealers'
  render: ->
    div className: 'dealers-page',
      div className: 'banner',
        R.img
          src: '/img/cityscape-banner@2x.jpg'
          alt: 'Cityscape'
      R.h2 null, 'Find a dealer near you'

      Location()
