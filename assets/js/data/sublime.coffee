SPECIES = require './species'
DIMENTIONS = require './dimentions'
COMPOSITION = require './composition'
IMAGES = require './images'

STATUSES =
  current: 'current'
  discontinued: 'discontinued'
  removed: 'removed'

module.exports = [
  name: 'Sugar and Spice'
  status: STATUSES.current
  brightness: 0.8
  species: SPECIES.russianWhiteOak
  dimentions: DIMENTIONS.standard
  composition: COMPOSITION.nineteenSix
  description: '''
    Brushed two tone, white over contrasting dark gray.
  '''
  images:
    key: 'sugar-spice'
    set: IMAGES.productSet
,
  name: 'Olive Ebony Gray'
  status: STATUSES.discontinued
  brightness: 0.2
  species: SPECIES.russianWhiteOak
  dimentions: DIMENTIONS.standard
  composition: COMPOSITION.nineteenSix
  description: '''
    Brushed back olive gray over contrasting black grain.
  '''
  images:
    key: 'olive-ebony-gray'
    set: IMAGES.productSet
,
  name: 'Ivory and Clay'
  status: STATUSES.current
  brightness: 0.6
  species: SPECIES.russianWhiteOak
  dimentions: DIMENTIONS.standard
  composition: COMPOSITION.nineteenSix
  description: '''
    Brushed two tone taupe over white grain
  '''
  images:
    key: 'ivory-clay'
    set: IMAGES.productSet
,
  name: 'Dun Taupe'
  status: STATUSES.current
  brightness: 0.5
  species: SPECIES.russianWhiteOak
  dimentions: DIMENTIONS.standard
  composition: COMPOSITION.nineteenSix
  description: '''
    Brushed light brown taupe
  '''
  images:
    key: 'dun-taupe'
    set: IMAGES.productSet
,
  name: 'Burnt Alabaster'
  status: STATUSES.current
  brightness: 0.7
  species: SPECIES.russianWhiteOak
  dimentions: DIMENTIONS.standard
  composition: COMPOSITION.nineteenSix
  description: '''
    Double smoked oak natural, brushed
  '''
  images:
    key: 'burnt-alabaster'
    set: IMAGES.productSet
]
