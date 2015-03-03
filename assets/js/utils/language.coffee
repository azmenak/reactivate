###*
# Language localization module
# When used in the browser, should auto-detect language settings
#
# @param content {string | object} keyed content with language codes to be
# returned for a given or detected language eg.
#   content = {
#     'en-ca': 'I like the colour red'
#     'en': 'I like the color red'
#     'zh': '我喜欢红颜色'
#   }
# @param [lang] {string} language code (eg. "en-US") for language to be retuned
###

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
