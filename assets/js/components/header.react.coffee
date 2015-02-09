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

  componentDidMount: ->
    BASE_HEIGHT = @refs['menuItems'].getDOMNode().children[0].offsetHeight
    init = false
    heightCheck = =>
      narrow = false
      for node in @refs['menuItems'].getDOMNode().children
        if node.offsetHeight > BASE_HEIGHT
          narrow = true
          break
      if @state.narrow isnt narrow
        @setState
          narrow: narrow
          narrowBreakpoint: window.innerWidth

      if not init
        @state.narrowBreakpoint = if narrow then 0 else Infinity

    heightCheck() #init
    init = true
    window.addEventListener 'resize', heightCheck

  render: ->
    R.header className: 'main-header',
      div className: 'logo',
        R.img
          src: '/img/urbania.svg'

      R.nav className: 'main-menu',
        R.ul
          className: Cx
            'menu-items': true
            'narrow': @state.narrow
          ref: 'menuItems'
        ,
          @menuWalker(@menuItems)
