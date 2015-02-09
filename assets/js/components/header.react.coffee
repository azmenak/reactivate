data = require '../data'
React = require 'react'
Router = require 'react-router'
MenuItem = require './menu-item.react'
Cx = require 'react/lib/cx'
process = require '../utils/tag-processor'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Header'

  getInitialState: ->
    narrow: false
    narrowBreakpoint: null

  menuItems:
    '/': 'home'
    '/lifestyle': 'lifestyle'
    '/products':
      name: 'products'
      '/sublime': 'sublime'
      '/ee': 'expressive essentials'
    '/dealers': 'where to buy'
    '/gallery': 'gallery'
    '/testimonials': 'testimonials'
    '/contact': 'contact'

  menuWalker: (menu) ->
    for path, name of menu
      if typeof name is 'object'
        # Deep clone name object, otherwise name: gets deleted
        subMenu = JSON.parse(JSON.stringify(name))
        delete subMenu.name
        MenuItem
          path: path
          key: path
          label: name.name.toUpperCase()
        ,
          R.ul className: 'sub-menu menu-items',
            for subPath, subName of subMenu
              MenuItem
                path: subPath
                key: subPath
                label: subName.toUpperCase()
      else
        MenuItem
          path: path
          key: path
          label: name.toUpperCase()

  render: ->
    R.header className: 'main-header',
      div className: 'logo',
        R.h1 null, 'URBANIA'

      R.nav className: 'main-menu',
        R.ul className: 'menu-items',
          @menuWalker(@menuItems)
