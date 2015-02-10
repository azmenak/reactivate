React = require 'react'
Paragraphs = require '../paragraphs.react'
SublimeProductItem = require './sublime-product-item'
data = require '../../data'

R = React.DOM
div = R.div

copy = data.pages.sublime.copy
products = data.products.sublime.filter (product) ->
  product.status is 'current'

module.exports = React.createFactory React.createClass
  displayName: 'Sublime'

  render: ->
    div className: 'sublime-page u-grid',
      div className: 'u-left',
        R.h3 null, 'Product Specifications'

      div className: 'u-right',
        R.h2 null, copy.headline
        Paragraphs
          body: copy.body

        div className: 'products',
          for product in products
            SublimeProductItem
              info: product
              key: product.images.key
