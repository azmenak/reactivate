data = require '../data'
React = require 'react'
Router = require 'react-router'
MenuItem = require './menu-item.react'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Header'

  menuItems:
    '/': 'home'
    '/lifestyle': 'lifestyle'
    '/products':
      '/sublime': 'sublime'
      '/ee': 'expressive essentials'
    '/dealers': 'where to buy'
    '/gallery': 'gallery'
    '/testimonials': 'testimonials'
    '/contact': 'contact'

  menuWalker: (menu) ->
    for path, name of menu
      if typeof name is 'object'
        R.ul className: 'sub-menu menu-items',
          for subPath, subName of name
            MenuItem
              path: subPath
              key: subPath
            , subName.toUpperCase()
      else
        MenuItem
          path: path
          key: path
        , name.toUpperCase()

  render: ->
    R.header className: 'main-header',
      div className: 'logo',
        R.h1 null, 'URBANIA'

      R.nav className: 'main-menu',
        R.ul className: 'menu-items',
          @menuWalker(@menuItems)
