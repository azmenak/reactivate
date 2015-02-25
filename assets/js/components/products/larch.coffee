React = require 'react'

R     = React.DOM
div   = R.div
ul    = R.ul
li    = R.li

data = require '../../data/larch'

module.exports = React.createFactory React.createClass
  displayName: 'Siberian Larch'

  componentDidMount: ->
    rows = @refs['dataTable'].getDOMNode().querySelectorAll 'tbody tr'
    for cell in rows
      cell.children

    console.log 'HI'
    console.log @refs['dataTable']

  render: ->
    div className: 'info larch',
      R.h2 null, 'URBANIA Siberian Larch Core'
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
                R.th scope: 'col', 'Longitudinal Bending'
            R.tbody null,
              R.tr null,
                R.th scope: 'row', 'Siberian Larch'
                R.td null, '1100 lb/in²'
                R.td null, '750 kg/m³'
                R.td null, '9000 Mpa'
              R.tr null,
                R.th scope: 'row', 'Yellow Poplar'
                R.td null, '540 lb/in²'
                R.td null, '455 kg/m³'
                R.td null, '6500 Mpa'
              R.tr null,
                R.th scope: 'row', 'Baltic Birch'
                R.td null, '1210 lb/in²'
                R.td null, '700 kg/m³'
                R.td null, '9610 Mpa'

          R.h4 null, 'Janka Hardness'
          R.p null, 'Measures the indent created by droping a steel ball
          of Xg from 1M'

          R.h4 null, 'Density'
          R.p null, 'No clue how this is measured'

          R.h4 null, 'Longitudinal Bending Modulus of ¾” Plywood'
          R.p null, 'Also no idea'

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
            li null, 'Acceptable ambient humidity range is 20% - 80%'
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
