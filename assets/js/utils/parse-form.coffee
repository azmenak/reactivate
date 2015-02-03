module.exports = (formElement) ->
  _res = {}
  inputIndex = 1
  for input in formElement
    name = input.name or "input-#{inputIndex++}"
    _res[name] = input.value
  _res
