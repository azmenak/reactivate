React = require 'react'
ContactForm = require './form'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Contact'

  getInitialState: ->
    email: null
    phone: null

  componentDidMount: ->
    phone = [
      '1'
      '800'
      '493'
      '2041'
    ]
    @setState
      phone: phone.join '.'

  telLink: ->
    if @state.phone
      R.a href: "tel:+#{@state.phone.replace /[^\d]/g, ''}", @state.phone
    else
      '[phone]'

  render: ->
    div className: 'contact-page',
      div className: 'u-grid',
        div className: 'u-left',
          R.h2 null, 'Head Office'
          div className: 'addr',
            R.p null,
              '6710 Maritz Dr.'
              R.br null
              'Mississauga, Ontario, '
              R.span className: 'zip-postal', 'L5W 0A1'
              R.br null
              'Canada'
          div className: 'phone',
            R.p null,
              'Phone: '
              @telLink()

        div className: 'u-right',
          R.h2 null, 'Contact Us'
          div className: 'content',
            R.p ref: 'blurb',
              'If you have any questions about the Urbania brand, send us a
              message and a representative will get back to you shortly.'

            ContactForm()
