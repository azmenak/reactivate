DEALERS = require './data/dealers'
SUBLIME = require './data/sublime'
EE      = require './data/ee'
IMAGES  = require './data/images'
GALLERY = require './data/gallery'

data =
  stores: DEALERS
  gallery: GALLERY
  pages:
    home:
      copy:
        headline: 'Chic Authentic'
        lifestyle: 'See the Urbania lifestyle'
        installation: 'Take a look at available products'
      slides: [
        background: '/img/room-with-fireplace-slide@2x.jpg'
      ]
    lifestyle:
      copy:
        headline: 'The URBANIA lifestyle'
      slides: [
        headline: 'The product'
        body:
          'The Urbania brand is a hardwood flooring product driven by design
          aesthetics combined with the superior quality of real wood flooring.
          The unmistakable wood grain and innovative colours are created with
          advanced finishing techniques, providing a unique hardwood flooring
          look that is modern and contemporary.'
        background: '/img/women-lying-on-floor-long-slide@2x.jpg'
      ,
        headline: 'the experience'
        body: 'Lorem Ipsum this floor is awesome'
        background: '/img/room-with-two-couches-slide@2x.jpg'
      ]
    products:
      copy:
        headline: 'URBANIA Collections'
        body: '''
          Choose your collection; URBANIA Sublime a 7” wide by 7’ long plank
          floor or URBANIA Expressive Essentials a Random Length ¾” Engineered
          Solid Sawn available in 3.5” & 5” widths.
        '''
      chooser:
        sublime:
          image: '/img/women-lying-on-floor-square@2x.jpg'
          copy: '''
            URBANIA Sublime Engineered Hardwood Floors are designed for
            discerning consumers who understand and appreciate the value of
            uncompromising quality.

            URBANIA is proud to present a product line that is truly unique,
            one that is produced with the highest quality raw materials and
            processed on a state of the art German production line. The
            balanced & symmetrical product assembly, the moisture content
            control and the vertically oriented tight grain of the core combine
            to yield an engineered wood floor with unparalleled stability.

            The finishes of the URBANIA Sublime collection were chosen to be a
            tool in the hands of the Interior Design Professional as well as
            those with the talent and creativity to create their own beautiful
            spaces. We strive to offer an element within your design scheme
            that is both unique and beautifully pleasing to the eye.
          '''
        ee:
          image: '/img/two-people-lying-on-floor-square@2x.jpg'
          copy: '''
            The URBANIA Expressive Essentials product collection was designed
            and built to be a main stream alternative to conventional ¾” solid
            strip flooring. The 6 mm “Same as Solid” wear layer has a service
            life equivalent to solid wood flooring.  The precise milling makes
            this product very installer friendly and the traditional choice of
            surface finishes appeal to a wide range of wood flooring consumers.
          '''
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
        images:
          set: IMAGES.productSet
      colours: EE
    sublime: SUBLIME

module.exports = data
