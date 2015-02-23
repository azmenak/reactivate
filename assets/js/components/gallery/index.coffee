React        = require 'react'
Router       = require 'react-router'
data         = require '../../data'

RouteHandler = React.createFactory Router.RouteHandler
Link         = React.createFactory Router.Link
R            = React.DOM
div          = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Gallery'

  render: ->
    div className: 'gallery-page',
      R.h2 null, 'Gallery'
      div className: 'u-grid',
        div className: 'u-left',
          R.h3 null, 'Collections'
          div className: 'collections',
            for key, collection of data.gallery
              div className: 'collection', key: key,
                imgs:
                  for i in [1..3]
                    Link to: "/gallery/#{key}", key: key+i,
                      R.img
                        className: 'thumbnail'
                        alt: collection.name
                        src:
                          "/img/gallery/#{key}/export/\
                          #{key}-#{i}-small-swatch@2x.jpg"
                title:
                  Link to: "/gallery/#{key}",
                    R.h4 null, collection.name

        div className: 'u-right',
          RouteHandler()
