Cx = require 'react/lib/cx'
React = require 'react'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Sublime Product Item'

  getInitialState: ->
    largeImgShown: false

  propTypes:
    info: React.PropTypes.object.isRequired

  imgPath: (key, size) ->
    "/img/sublime/export/#{key}-#{size}@2x.jpg"

  openLargeImg: (e) ->
    @setState
      largeImgShown: true

  hideLargeImg: (e) ->
    @setState
      largeImgShown: false

  render: ->
    div
      className: 'product'
      id: @props.info.images.key
    ,
      div
        className: 'banner'
        onClick: @openLargeImg
      ,
        div className: 'banner-text',
          R.h3 null, @props.info.name.replace('and', '&')
          R.p className: 'click-to-expand', 'Click to expand'
        R.img
          src: @imgPath @props.info.images.key, 'banner'
          alt: @props.info.description

      div
        className: Cx
          'large-img': true
          'shown': @state.largeImgShown
        onClick: @hideLargeImg
      ,
        div className: 'container-box',
          R.img
            src: @imgPath @props.info.images.key, 'large'
            alt: @props.info.description + ' - full size'
