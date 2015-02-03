DEALERS = require './data/dealers'

data =
  stores: DEALERS
  pages:
    home:
      copy:
        lifestyle: 'See the Urbania lifestyle'
        installation: 'Take a look at available products'
    lifestyle:
      slides: [
        headline: 'the product'
        body: 'The Urbania brand is a hardwood flooring product driven by
        design aesthetics combined with the superior quality of real wood
        flooring. The unmistakable wood grain and innovative colours are
        created with advanced finishing techniques, providing a unique
        hardwood flooring look that is modern and contemporary.'
        background: '<insert img src>'
      ,
        headline: 'the experience'
        body: 'Lorem Ipsum this floor is awesome'
        background: '<insert img src>'
      ]
  products:
    ee:
      specs:
        species: 'White Oak'
        grade: 'AB or ABC'
        colorVariation: 'low'
        glossLevel: 10
        dimentions:
          tickness: 19
          width: 130
          length: 2200
        construction:
          top: '6mm dry sawn'
          core: '7mm dry sawn Canadian Pine'
          backer: '6mm dry sawn Canadian Pine'

console.log data

module.exports = data
