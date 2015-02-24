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
        R.h2 null, 'Specs'
        div className: 'specs',
          div className: 'spec',
            R.h4 null, 'Dimentions'
            R.dl null,
              R.dt null, 'Length: '
              R.dd null, '1860 mm'
            R.dl null,
              R.dt null, 'Width: '
              R.dd null, '189 mm'
            R.dl null,
              R.dt null, 'Tickness: '
              R.dd null, '19 mm'
        div className: 'spec',
          R.h4 null, 'Contstruction'
          R.dl null,
            R.dt null, 'Ware-layer: '
            R.dd null, '4 mm dry sawn hardwood'
          R.dl null,
            R.dt null, 'Core Material: '
            R.dd null, '15 mm Siberian Larch plywood'

      div className: 'u-right',
        R.h2 null, copy.headline
        Paragraphs
          body: copy.body

        div className: 'products',
          for product in products
            SublimeProductItem
              info: product
              key: product.images.key
