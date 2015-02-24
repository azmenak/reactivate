mkdirp      = require 'mkdirp'
fs          = require 'fs'
jade        = require 'jade'
routes      = require 'app/routes'
routerUtils = require 'app/utils/router-utils'
reactify    = require 'cli/reactify'
htmlMin     = require 'html-minifier'
Q           = require 'q'

routeTree = routerUtils.routeTree routes
paths = []
treeWalker = (node) ->
  if node.children
    for n in node.children
      treeWalker n
  paths.push node.path
treeWalker routeTree

layout = jade.compileFile './layout.jade'

module.exports = (location = 'pages') ->
  deferred = Q.defer()
  mkdirp "./#{location}", ->
    for path in paths
      do (path) ->
        mkdirp "./#{location}" + path, ->
          file = "./#{location}#{path}/index.html"
          htmlString = layout content: reactify(path)
          minifiedHTML = htmlMin.minify htmlString
          fs.writeFile file, minifiedHTML, (err) ->
            if err then console.log err
            else console.log file
            deferred.resolve file

  deferred.promise
