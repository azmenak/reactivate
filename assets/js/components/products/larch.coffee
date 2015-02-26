React = require 'react'

R     = React.DOM
div   = R.div
ul    = R.ul
li    = R.li

data = require '../../data/larch'

module.exports = React.createFactory React.createClass
  displayName: 'Siberian Larch'

  render: ->
    div className: 'info larch',
      R.h2 null, 'URBANIA Siberian Larch Core'
      R.p null,
        'Also known as '
        R.a
          href: 'http://en.wikipedia.org/wiki/Larix_sibirica'
          target: '_blank'
        , 'Larix sibirica'
        ', not to be confused with Western Larch common in North America.
        Siberian larch is a rot resistant tree with many unique properties
        which make it ideal for flooring core material.'
      R.p null,
        ul null,
          li null, 'Larch is a softwood species that is native to many
          countries around the world and yet the special properties of the
          Larch that grows in Siberia, are little known in the western world.'
          li null, 'The short growing season and the harsh climate in Siberia
          yield a lumber that has a high concentration of “late wood”; that is
          the dense, darker and stronger part of the ring that grows in the
          late summer and early fall, additionally Siberian Larch has both a
          high resin content and a high concentration of Sapwood, (75% – 90%)
          when dried slowly and with proper care the timber and plywood
          produced from Siberian Larch manifest a unique property: ',
            R.strong null, 'Siberian Larch resists absorbing and giving up
            moisture. '
          li null, 'The combination of high strength, high density and the
          resistance to moisture content change when exposed to extreme
          climates imbue Siberian Larch with the ideal properties needed for
          the production of a stable engineered wood flooring suitable for the
          wide variety of climates in both Canada & the USA.'
          li null, 'Urbania Canada has partnered with China’s only producer of
          Japanese grade Siberian Larch Plywood; our vendor has achieved a JAS
          Type 1 Certificate for their Larch Plywood, 95% of the production is
          sold to the Japanese Construction market. JAS Type one requires the
          following:',
            ul null,
              li null, 'No measurable emissions of Formaldehyde'
              li null, 'The plywood is considered “Water Boil Proof” passing a
              72 hour boil test'
        R.h3 null, 'Comparative Properties of Siberian Larch'
        div className: 'info-section',
          R.table className: 'info-table responsive larch', ref: 'dataTable',
            R.thead null,
              R.tr null,
                R.th className: 'corner', 'Materials'
                R.th scope: 'col', 'Janka Hardness'
                R.th scope: 'col', 'Density'
                R.th scope: 'col', 'Bending Modulus'
            R.tbody null,
              R.tr null,
                R.th scope: 'row', 'Siberian Larch'
                R.td null, '1100 lb/in²'
                R.td null, '750 kg/m³'
                R.td null, '9000 MPa'
              R.tr null,
                R.th scope: 'row', 'Yellow Poplar'
                R.td null, '540 lb/in²'
                R.td null, '455 kg/m³'
                R.td null, '6500 MPa'
              R.tr null,
                R.th scope: 'row', 'Baltic Birch'
                R.td null, '1210 lb/in²'
                R.td null, '700 kg/m³'
                R.td null, '9610 MPa'

        R.h4 null, 'Janka Hardness Test'
        R.p null, 'The Janka hardness test measures the resistance of a
        sample of wood to denting and wear. It measures the force required to
        embed an 11.28mm (.444 in) steel ball into wood to half the ball\'s
        diameter. ',
          R.a
            href: 'http://en.wikipedia.org/wiki/Janka_hardness_test'
            target: '_blank'
          , 'More info...'

        R.h4 null, 'Density'
        R.p null, 'Density is a simple measure of the wood\'s weight per
        volume, measured in Kilograms per Cubic Meter.'

        R.h4 null, 'Longitudinal Bending Modulus of ¾” Plywood'
        R.p null,
          'Also referred as the ',
          R.a
            href: 'http://en.wikipedia.org/wiki/Elastic_modulus'
            target: '_blank'
          , 'Modulus of Elasticity'
          ' or '
          R.a
            href: 'http://en.wikipedia.org/wiki/Young%27s_modulus'
            target: '_blank'
          , 'Young\'s modulus'
          ', and is measured in pascals (Mega-pacals MPa). Bending implies
          that deformations produced by low stress are completely recoverable
          after loads are removed. When loaded to higher stress levels,
          plastic deformation or failure occurs. Higher levels imply the wood
          is more flexible. '
          R.a
            href: 'http://www.sapub.org/global/\
            showpaperpdf.aspx?doi=10.5923/j.ijaf.20120204.06'
            target: '_blank'
          , 'More info on how this test is performed...'

        R.p null,
          'Comprehensive information about mechanical properties of wood is
          available '
          R.a
            href: 'http://www.fpl.fs.fed.us/documnts/\
            fplgtr/fplgtr190/chapter_05.pdf'
            target: '_blank'
          , 'here.'

        R.h3 null, 'Historical Facts about Siberian Larch'
        ul null,
          li null, 'The city of Venice Italy was built on Siberian Larch Core
          Pilings'
          li null, 'The Vikings sailed in ships made from Siberian Larch'
          li null, 'Many of Russia’s oldest buildings were built with
          Siberian Larch some as old as 800 years old remain standing today.'

      R.h3 null, 'Ideal Applications for Larch Core Floors'
        ul null,
          li null, 'Glue Down Installations over Hydronic Radiant Heat,
          maximum operating temp is 30°C (86°F)'
          li null, 'Direct Glue Down over concrete (minimum 60 day cure
          time)'
          li null, 'Nail Down in new construction, Larch Core Floors will
          tolerate a sub floor with up to 16% moisture content.'
          li null, 'Floating installations over concrete and wooden
          sub-floors. T&G perimeter gluing required for floating
          installations'
          li null, 'Acceptable ambient humidity range is 25% - 70%'
          li null, 'Suitable for nail down installation over 18 mm OSB'
          li null, 'Water Borne mastic engineered wood flooring adhesives OK'

      R.h3 null, 'Why Larch Core Floors for your home?'
      ul null,
        li null, 'Siberian Larch like Baltic Birch has a density much closer
        to White Oak, Floors produced with Siberian Larch or Baltic Birch
        will have a much higher dent resistance vs. floors produced with
        Poplar.'
        li null, 'Siberian Larch plywood produced to meet Japanese Standards
        has no harmful emissions and is guaranteed not to delaminate even
        under the most extreme conditions.'
        li null, 'Siberian Larch plywood has a very high bending strength 50%
        higher than Poplar Plywood and similar to Baltic Birch plywood, This
        provides maximum gap and cup resistance even at extremely low ambient
        humidity levels (warrantied to a minimum of 20% ambient humidity).'
        li null, 'Siberian Larch Plywood will resist the uptake or loss of
        moisture; the natural resins that protect Siberian Larch are not
        present in Baltic Birch.'
        li null, 'Siberian Larch is not an endangered species.'
