mkdirp      = require 'mkdirp'
fs          = require 'fs'
jade        = require 'jade'
routes      = require 'app/routes'
routerUtils = require 'app/utils/router-utils'
reactify    = require 'cli/reactify'

routeTree = routerUtils.routeTree routes
paths = []
treeWalker = (node) ->
  if node.children
    for n in node.children
      treeWalker n
  paths.push node.path
treeWalker routeTree

layout = jade.compileFile './layout.jade', pretty: true

module.exports = (location = 'pages') ->
  mkdirp "./#{location}", ->
    for path in paths
      mkdirp "./#{location}" + path, ->
        file = "./#{location}#{path}/index.html"
        htmlString = layout content: reactify(path)
        fs.writeFile file, htmlString, (err) ->
          if err then console.log err
          else console.log file
