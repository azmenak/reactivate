SPECIES = require './species'
DIMENTIONS = require './dimentions'
COMPOSITION = require './composition'
IMAGES = require './images'

STATUSES =
  current: 'current'
  discontinued: 'discontinued'
  removed: 'removed'

VENDORS =
  huade: 'Dalian Huade'
  bm: 'Best Mountain Floors'

SPECS =
  dimentions: DIMENTIONS.sublime
  composition: COMPOSITION.nineteenFour
  species: SPECIES.russianWhiteOak

module.exports = [
  name: 'Sugar and Spice'
  vendor: VENDORS.huade
  status: STATUSES.current
  brightness: 0.8
  description: '''
    Brushed two tone, white over contrasting dark gray.
  '''
  images:
    key: 'sugar-spice'
    set: IMAGES.productSet
,
  name: 'Olive Ebony Gray'
  vendor: VENDORS.huade
  status: STATUSES.discontinued
  brightness: 0.2
  description: '''
    Brushed back olive gray over contrasting black grain.
  '''
  images:
    key: 'olive-ebony-gray'
    set: IMAGES.productSet
,
  name: 'Ivory and Clay'
  vendor: VENDORS.huade
  status: STATUSES.current
  brightness: 0.6
  description: '''
    Brushed two tone taupe over white grain
  '''
  images:
    key: 'ivory-clay'
    set: IMAGES.productSet
,
  name: 'Dun Taupe'
  vendor: VENDORS.huade
  status: STATUSES.current
  brightness: 0.5
  description: '''
    Brushed light brown taupe
  '''
  images:
    key: 'dun-taupe'
    set: IMAGES.productSet
,
  name: 'Burnt Alabaster'
  vendor: VENDORS.huade
  status: STATUSES.current
  brightness: 0.7
  description: '''
    Double smoked oak natural, brushed
  '''
  images:
    key: 'burnt-alabaster'
    set: IMAGES.productSet
]
