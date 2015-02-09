React = require 'react'

tagProcessor = (body, search, tag, className) ->
  parts = body.split search
  pLength = parts.length
  parts.reduce (prev, curr, index) ->
    prev.push curr
    if index+1 < pLength
      prev.push React.DOM[tag]({className}, search.replace(/[\[\]]/g, ''))
    prev
  , []

module.exports = tagProcessor
