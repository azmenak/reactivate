data = require '../../data'
React = require 'react'
Router = require 'react-router'
Paragraphs = require '../paragraphs.react'

Link = React.createFactory Router.Link

R = React.DOM
div = R.div

copy = data.pages.products.copy

module.exports = React.createFactory React.createClass
  displayName: 'Products'

  render: ->
    div className: 'products-page',
      R.h2 null, copy.headline
      R.p className: 'body', copy.body
      div className: 'product-chooser',
        div className: 'sublime-left',
          div className: 'selection-box',
            Link to: '/sublime',
              R.h3 null, 'Sublime'
              R.img
                src: data.pages.products.chooser.sublime.image
                alt: 'See Sublime'
          Paragraphs body: data.pages.products.chooser.sublime.copy
          div className: 'link',
            Link to: '/sublime', className: 'btn btn-default', 'See Sublime'
        div className: 'ee-right',
          div className: 'selection-box',
            Link to: '/ee',
              R.h3 null, 'Expressive Essentials'
              R.img
                src: data.pages.products.chooser.ee.image
                alt: 'Expressive Essentials'
          Paragraphs body: data.pages.products.chooser.ee.copy
          div className: 'link',
            Link to: '/ee', className: 'btn btn-default', 'Browse EE'
