React = require 'react'

R = React.DOM
div = R.div

module.exports = React.createFactory React.createClass
  displayName: 'Contact'

  getInitialState: ->
    email: null
    phone: null

  componentDidMount: ->
    parts = [
      'email'
      '@'
      'urbaniacanada.com'
    ]
    phone = [
      '1 800'
      '493'
      '2041'
    ]
    @setState
      email: parts.join ''
      phone: phone.join '.'

  mailToLink: ->
    if @state.email
      to = 'emile@urbaniacanada.com'
      subject = 'Website Inquiry'
      R.a href: "mailto:#{to}?subject=#{subject}", to
    else
      '[email]'

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
              'Mississauga Ontario, L5W 0A1'
              R.br null
              'Cananda'
          div className: 'phone',
            R.p null,
              'Phone: '
              @telLink()

        div className: 'u-right',
          R.h2 null, 'Contact Us'
          div className: 'content',
            R.p ref: 'blurb',
              'If you have any questions about the Urbania brand, send an email
              to '
              @mailToLink()
              ' and a representative will get back to you shortly.'
