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
GRADES =
  AB: 'AB'
  ABC: 'ABC'
  ABCD: 'ABCD'
FINISHES =
  natural: 'Natural oil'
  wax: 'Reduced maintenance hard wax oil'
  lacquer: 'Maintenance-free lacquer'

module.exports =
  specs: SPECS
  colours:
    'calico-oil':
      name: 'Calico Natural Oil'
      status: STATUSES.current
      brightness: 0.75
      grade: GRADES.ABCD
      finish: FINISHES.natural
      description: '''
        Light brown natural oil finish with 0 gloss.
      '''
    'naked-oak':
      name: 'Naked Oak'
      status: STATUSES.current
      brightness: 0.9
      grade: GRADES.AB
      finish: FINISHES.lacquer
      description: '''
        "Invisible finish", designed to appear unfinished and natural with full
        performance finish.
      '''
    'sugar-spice':
      name: 'Sugar and Spice'
      status: STATUSES.current
      brightness: 0.8
      grade: GRADES.ABC
      finish: FINISHES.lacquer
      description: '''
        Brushed two tone, white over contrasting dark gray.
      '''
    'olive-ebony-gray':
      name: 'Olive Ebony Gray'
      status: STATUSES.removed
      brightness: 0.2
      grade: GRADES.ABC
      finish: FINISHES.lacquer
      description: '''
        Brushed back olive gray over contrasting black grain.
      '''
    'ivory-clay':
      name: 'Ivory and Clay'
      status: STATUSES.current
      brightness: 0.6
      grade: GRADES.ABC
      finish: FINISHES.lacquer
      description: '''
        Brushed two tone taupe over white grain
      '''
    'calico-lacquer':
      name: 'Calico Brown'
      brightness: 0.7
      grade: GRADES.ABC
      finish: FINISHES.lacquer
      description: '''
        Mid-light brown finish, subtle grain pattern.
      '''
    'platinum-lacquer':
      name: 'Platinum Gray'
      status: STATUSES.current
      brightness: 0.5
      finish: FINISHES.lacquer
      description: '''
        Modern gray finish over subtle contrasting white tones.
      '''
    'dun-taupe':
      name: 'Dun Taupe'
      status: STATUSES.current
      brightness: 0.5
      grade: GRADES.ABC
      finish: FINISHES.lacquer
      description: '''
        Brushed light brown taupe
      '''
    'burnt-alabaster':
      name: 'Burnt Alabaster'
      status: STATUSES.current
      brightness: 0.7
      grade: GRADES.ABC
      finish: FINISHES.lacquer
      description: '''
        Double smoked oak natural, brushed
      '''
    'ebony-brown':
      name: 'Ebony Brown Oak'
      status: STATUSES.current
      brightness: 0.3
      grade: GRADES.ABC
      finish: FINISHES.lacquer
      description: '''
        Coffee brown over dark brown grain, subtle contrast.
      '''
    'ocher-smoked':
      name: 'Ocher Smoked Oak Natural'
      status: STATUSES.discontinued
      brightness: 0.4
      grade: GRADES.ABC
      finish: FINISHES.lacquer
      description: '''
        Single smoked oak natural, with moderate wire brushing
      '''
    'chevale-blanc':
      name: 'Chevale Blanc'
      status: STATUSES.discontinued
      grade: GRADES.AB
      finish: FINISHES.lacquer
      description: '''
        Soft whitte with natural wood grain evident.
      '''

