module.exports =
  postalCode: (postal) ->
    compact = postal.replace /\s/, ''
    compact[0..2] + ' ' + compact[3..5]

  zipPostal: (zp) ->
    if zp.trim().length is 5
      zp.trim()
    else
      @postalCode(zp)

  phoneNumber: (numString) ->
    numString.replace /(\d{3})(\d{3})(\d{4})/, '($1) $2-$3'

  webAddr: (web) ->
    web.replace /^((https?\:\/\/)?(www)?\.?)/, ''
      .replace /(\/)$/, ''
