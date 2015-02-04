React = require 'react'

module.exports = React.createFactory React.createClass
  displayName: 'Paragraphs'

  propTypes:
    body: React.PropTypes.string.isRequired

  render: ->
    React.DOM.div className: 'paragraphs',
      for paragraph, i in @props.body.split('\n\n')
        React.DOM.p key: i,
          paragraph.replace('\n', ' ')

