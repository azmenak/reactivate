React = require 'react'
data = require '../data'

R = React.DOM
div = R.div

window?.testData = data

Test = React.createClass
  render: ->
    div null,
      R.h2 className: 'test', 'HI'
      R.p className: 'lifestyle',
        data.pages.home.lifestyleCopy

module.exports = React.createFactory(Test)
