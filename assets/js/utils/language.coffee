lang =
  detected: null
  getLang: ->
    return unless window?
    unless @detected
      @detected = if navigator.languages?
        navigator.languages[0]
      else
        navigator.language or navigator.userLanguage
    @detected


