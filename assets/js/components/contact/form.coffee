React     = require 'react'
parseForm = require '../../utils/parse-form'

R         = React.DOM

module.exports = React.createFactory React.createClass
  displayName: 'Contact Form'

  getInitialState: ->
    status: null
    name: null
    email: null

  sendForm: (e) ->
    e.preventDefault()
    formData = new FormData(e.target)
    formValues = parseForm e.target
    @setState
      status: 'sending'
      name: formValues.name
      email: formValues.email
    req = new XMLHttpRequest()
    req.open 'POST', e.target.action, true
    req.send formData
    req.onload = (progressEvent) =>
      if 200 <= req.status < 400
        @setState status: 'success'
      else
        @setState status: 'error'
    req.onerror = =>
      @setState status: 'connection-error'

  render: ->
    R.form
      className: 'contact-form u-form ' + @state.status
      acceptCharset: 'UTF-8'
      action: 'https://formkeep.com/f/0a68d19b4139'
      method: 'POST'
      onSubmit: @sendForm
    ,
      R.p className: 'message ' + @state.status,
        switch @state.status
          when 'success'
            [ 'Thanks for contacting URBANIA Canada, '
              R.strong key: 'name', @state.name
              '. We\'ll have a representative respond to your message at '
              R.strong key: 'email', @state.email
              ' ASAP.' ]
          when 'connection-error'
            'There was a connection error, we couldn\'t end the message. Try
            sending again when your connection is back up.'
          when 'error'
            'Sorry, we\'re having some problems processing your message. Try to
            reload this page and send again, if the issue continues please send
            an email with your message to emile@urbaniacanada.com'

      R.input type: 'hidden', name: 'utf8', defaultValue: '✓'
      R.div className: 'form-inputs',
        R.input
          name: 'name'
          type: 'text'
          placeholder: 'Your name'
          required: true
        R.input
          name: 'email'
          placeholder: 'Your email'
          required: true
        R.input
          name: 'company'
          type: 'text'
          placeholder: 'Company Name (optional)'
        R.textarea
          name: 'message'
          placeholder: 'Your message'
          required: true
          rows: 5
      R.button
        type: 'submit'
        className: 'btn btn-default btn-block'
        disabled: @state.status not in [null, 'connection-error']
      ,
        switch @state.status
          when 'sending' then 'Sending...'
          when 'success' then 'Message Sent!'
          when 'error' then 'Error sending message.'
          when 'connection-error' then 'Couldn\'t connect. Try again?'
          else 'Send'
