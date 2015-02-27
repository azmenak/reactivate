mkdirp      = require 'mkdirp'
fs          = require 'fs'
jade        = require 'jade'
routes      = require 'app/routes'
routerUtils = require 'app/utils/router-utils'
reactify    = require 'cli/reactify'
htmlMin     = require 'html-minifier'
Q           = require 'q'

PROD = process.env.NODE_ENV is 'production'

routeTree = routerUtils.routeTree routes
paths = []
treeWalker = (node) ->
  if node.children
    for n in node.children
      treeWalker n
  paths.push node.path
treeWalker routeTree

layout = jade.compileFile './layout.jade'

getManifest = (path, fileName = 'manifest.json') ->
  try
    mfst = JSON.parse fs.readFileSync("#{path}/#{fileName}", 'utf-8')
  catch e
    mfst = null
  stylesheets = []
  scripts = []
  for key, val of mfst
    if /(\.css)$/.test val
      stylesheets.push val
    else if /(\.js)$/.test val
      scripts.push val
  {scripts, stylesheets}

module.exports = (location) ->
  location ?= "#{__dirname}/pages"
  manifestFiles = getManifest location

  deferredList = []
  mkdirp.sync location
  for path in paths
    do (path) ->
      # Ensure path exists
      mkdirp.sync "#{location}/#{path}"

      # Create deferred promisess
      deferred = Q.defer()
      deferredList.push deferred.promise
      # Name of output HTML file
      file = "#{location}/#{path}/index.html"
      # Render the jade template into HTML
      htmlString = layout
        content: reactify(path)
        stylesheets: manifestFiles.stylesheets
        scripts: manifestFiles.scripts
        PROD: PROD
      # Minify output
      minifiedHTML = htmlMin.minify htmlString
      fs.writeFile file, minifiedHTML, (err) ->
        if err
          unless PROD then console.log err
        else
          unless PROD then console.log file
        deferred.resolve file

  Q.all deferredList
