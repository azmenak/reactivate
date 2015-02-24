data = require '../data'
React = require 'react'
Router = require 'react-router'
MenuItem = require './menu-item.react'

routes = require '../routes'
RouterUtils = require '../utils/router-utils'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Header'

  getInitialState: ->
    narrow: false
    narrowBreakpoint: null

  menuItems: do ->
    routeTree = RouterUtils.routeTree routes
    children = JSON.parse(JSON.stringify(routeTree.children))
    children.push
      path: routeTree.path
      name: routeTree.name
      order: routeTree.order
    children
      .filter (c) -> c.order?
      .sort (a,b) -> +(a.order > b.order) or +(a.order is b.order) - 1

  menuTree: (menu) ->
    if Object::toString.call(menu)[8...-1].toLowerCase() is 'array'
      R. ul className: 'menu-items',
        for menuChild in menu
          @menuTree menuChild
    else
      return unless menu.path? and menu.name? and menu.order?
      MenuItem
        path: menu.path.toLowerCase()
        key: menu.path
        label: menu.name.toUpperCase()
      ,
        if menu.children?
          R.ul className: 'sub-menu menu-items',
            for subMenu in menu.children
              @menuTree subMenu

  render: ->
    R.header className: 'main-header',
      div className: 'logo',
        R.img
          src: '/img/urbania.svg'

      R.nav className: 'main-menu',
        @menuTree(@menuItems)
