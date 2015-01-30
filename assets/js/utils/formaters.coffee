module.exports =
  postalCode: (postal) ->
    compact = postal.replace /\s/, ''
    compact[0..2] + ' ' + compact[3..5]

  zipPostal: (zp) ->
    if zp.trim().length is 5
      zp.trim()
    else
      @postalCode(zp)
