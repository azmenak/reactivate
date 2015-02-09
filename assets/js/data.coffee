DEALERS = require './data/dealers'
SUBLIME = require './data/sublime'

data =
  stores: DEALERS
  pages:
    home:
      copy:
        headline: 'Chic Authentic'
        lifestyle: 'See the Urbania lifestyle'
        installation: 'Take a look at available products'
      slides: [
        background: 'http://placehold.it/1100x367.jpg'
      ,
        background: 'http://placehold.it/1100x367.jpg'
      ]
    lifestyle:
      slides: [
        headline: 'the product'
        body:
          'The Urbania brand is a hardwood flooring product driven by design
          aesthetics combined with the superior quality of real wood flooring.
          The unmistakable wood grain and innovative colours are created with
          advanced finishing techniques, providing a unique hardwood flooring
          look that is modern and contemporary.'
        background: '<insert img src>'
      ,
        headline: 'the experience'
        body: 'Lorem Ipsum this floor is awesome'
        background: '<insert img src>'
      ]
    sublime:
      copy:
        headline: 'URBANIA Sublime Product Collection'
        body: '''
          At Urbania Flooring, urban style is our identity we embrace it and
          are guided by the zeitgeist of all that it means to be “Urban” in
          today’s modern world.

          We strive to create a product that will resonate within the design
          community; professionals as well as those with the talent and
          creativity to create their own beautiful spaces. The Sublime
          Collection features 16 unique floors, from the rich brown tones of
          double smoked White Oak to the luxurious surface textures created by
          manually scrapping and distressing one plank at a time, we are
          confident that the Urbania Sublime collection can be that
          indispensable resource at the heart of your design inspirations.

          The Sublime Collection stands alone in the market as a 3/4″ thick, 7
          foot long and 7 inch wide engineered plank, we feature a 1/4″ dry
          sawn wear layer that will stand the test of time. You have all the
          benefits of a solid flooring element with the stability only possible
          with the “Engineered in Germany” dry sawn cross grain construction.
        '''
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
    sublime: SUBLIME

console.log data

module.exports = data
