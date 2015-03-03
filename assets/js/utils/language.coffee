languages = (content, lang) ->
  lang ?= languages.getLang()

  primary = lang.toLowerCase().split('-')
  regional = lang.toLowerCase()

  content[regional] or
  content[primary] or
  content['en-us'] or
  content['en'] or
  if typeof content is 'string' then content
  else
    content[Object.keys(content)[0]]

languages.detected = null
languages.setLang = (lang) ->
  @detected = lang
  @
languages.getLang = ->
  return '' unless window?
  unless @detected
    @detected = if navigator.languages?
      navigator.languages[0]
    else
      navigator.language or navigator.userLanguage
  @detected

module.exports = languages
