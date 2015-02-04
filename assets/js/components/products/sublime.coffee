React = require 'react'
Paragraphs = require '../paragraphs.react'
data = require '../../data'

R = React.DOM
div = R.div

copy = data.pages.sublime.copy

module.exports = React.createFactory React.createClass
  displayName: 'Sublime'

  render: ->
    div className: 'sublime-page u-grid',
      div className: 'u-left'

      div className: 'u-right',
        R.h2 null, copy.headline
        Paragraphs
          body: copy.body
