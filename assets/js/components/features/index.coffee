React = require 'react'
Paragraphs = require '../paragraphs.react'
data = require '../../data/features'

R = React.DOM
div = R.div


module.exports = React.createFactory React.createClass
  displayName: 'Features'

  render: ->
    div className: 'features-page',
      R.h2 null, data.copy.headline
      Paragraphs body: data.copy.body

      div className: 'features',
        for key, val of data.copy.features
          div className: 'feature', key: key, id: key,
            R.img src: "/img/export/#{key}.png", alt: key.replace '-', ' '
            R.p className: 'body', val.body
