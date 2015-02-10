###
  Tests stolen from Modernizr
  check their github page if there's a detection problem
###

FeatureTest =
  results: {}
  tests:
    touchEvents: ->
      'ontouchstart' in window or
      window.DocumentTouch and document instanceof DocumentTouch
    svg: ->
      !!document.createElementNS and
      !!document.createElementNS('http://www.w3.org/2000/svg', 'svg')
        .createSVGRect

module.exports = (t) ->
  return unless window?
  return FeatureTest.results[t] if FeatureTest.results.hasOwnProperty(t)

  unless FeatureTest.tests.hasOwnProperty(t)
    throw new Error "Undefined feature test: #{t}"

  res = FeatureTest.tests[t]()
  FeatureTest.results[t] = res; res
