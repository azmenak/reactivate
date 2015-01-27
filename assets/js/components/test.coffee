React = require 'react'

R = React.DOM
div = R.div

Test = React.createClass
  render: ->
    div null,
      R.h2 className: 'test', 'HI'

module.exports = React.createFactory(Test)
