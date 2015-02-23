childPaths = (route) ->
  children = route.props.children
  return unless children?
  _res = []
  for c in children
    path = c.props.path?.replace '?', ''
    if path? then _res.push path
  _res

routeTree = (route) ->
  node = {}
  return unless route.props.path?
  node.path = route.props.path.replace /(\w)(\/\??)$/, '$1'
  for key, val of route.props
    unless key in ['path', 'children', 'handler']
      node[key] = val
  if (children = route.props.children)?
    node.children = []
    for c in children
      if c.props.path?
        node.children.push routeTree c
  node

module.exports = {childPaths, routeTree}
