SPECIES = require './species'
DIMENTIONS = require './dimentions'
COMPOSITION = require './composition'

IMAGES =
  productSet: ['banner', 'large', 'swatch']

module.exports = [
  name: 'Sugar and Spice'
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
]
