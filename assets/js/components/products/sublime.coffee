React = require 'react'
Router = require 'react-router'
Paragraphs = require '../paragraphs.react'
SublimeProductItem = require './sublime-product-item'
Link = React.createFactory Router.Link
data = require '../../data'

R = React.DOM
div = R.div

copy = data.pages.sublime.copy

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
              R.dt null, 'Length —'
              R.dd null, '1860mm (6\'1¼")'
            R.dl null,
              R.dt null, 'Width —'
              R.dd null, '189mm (7½")'
            R.dl null,
              R.dt null, 'Tickness —'
              R.dd null, '19mm (¾")'
          div className: 'spec',
            R.h4 null, 'Contstruction'
            R.dl null,
              R.dt null, 'Top-layer = '
              R.dd null, '4mm dry sawn hardwood'
            R.dl null,
              R.dt null, 'Core Material = '
              R.dd null, '15mm Siberian Larch plywood'
          div className: 'spec',
            R.h4 null, 'Installation'
            R.dl null,
              R.dt null, 'Applications: '
              R.dd null, 'Glue or Nail'
          div className: 'spec',
            R.h4 null, 'Technical Details'
            R.dl null,
              R.dt null, 'Moisture Content: '
              R.dd null, '6-9%'
            R.dl null,
              R.dt null, 'Assembly: '
              R.dd null, 'Precision tongue and groove'
            R.dl null,
              R.dt null, 'Packaging: '
              R.dd null, 'Shrink wrapped boxes, 2.109m² (22.704ft²) per box'

        R.p null,
          Link
            to: '/siberian-larch'
          , 'More information about Siberian Larch'
        R.p null,
          Link
            to: '/warranty'
          , 'Warranty information for URBANIA products'
        R.p null,
          Link
            to: '/grades'
          , 'Information on product grading'

      div className: 'u-right',
        R.h2 null, copy.headline
        Paragraphs
          body: copy.body

        div className: 'products',
          for key, val of data.products.sublime.colours \
          when val.status isnt 'removed'
            SublimeProductItem
              info: val
              key: key
              id: key
