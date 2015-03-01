React = require 'react'

R     = React.DOM
div   = R.div
NA    = 'None allowed'
A     = 'Allowed'

module.exports = React.createFactory React.createClass
  displayName: 'Grades'

  getInitialState: ->
    grades: 'A B C D'

  showGrades: (gr) ->
    gr = gr
      .replace /\s+/g, ''
      .toUpperCase()
      .split ''
      .join ' '
    @setState
      grades: gr

  defects: [
    'Rough or shelly grain'
    'Hull outs'
    'Indents'
    'Shake'
    'Edge splintering'
    'Crushed grooved'
    'Mismanufacture'
    'UV and sander lines'
    'UV and stain skips'
    'Filler and UV build-up on edges and ends'
    'Trash in finish and filer pop'
    'Orange peel'
    'Chatter'
    'Bleed back'
    'Sander burns'
    'Rough sanding'
    'Brush marks'
    'White grain'
    'Dark/light ends'
  ]

  render: ->
    div className: 'info grades',
      R.h2 null, 'Standard Grades'
      R.table className: 'responsive specs product-specs ' + @state.grades,
        R.thead null,
          R.tr null,
            R.th className: 'corner', 'Defect type'
            R.th null, 'A'
            R.th null, 'AB'
            R.th null, 'ABC'
            R.th null, 'ABCD'
        R.tbody null,
          R.tr null,
            R.th null, 'Smooth tight knots'
            R.td null, '10mm max'
            R.td null, '20mm max'
            R.td null, '40mm max'
            R.td null, 'Allowed tight cracked'
          R.tr null,
            R.th null, 'Dead knots'
            R.td null, '5mm max'
            R.td null, '10mm max'
            R.td null, '30mm max, ',
              R.span className: 'nowrap', 'no drop-off'
            R.td null, 'No limits, ',
              R.span className: 'nowrap', 'must be filled'
          R.tr null,
            R.th null, 'Open Knots'
            R.td null, '5mm max, filled'
            R.td null, '10mm max, filled'
            R.td null, '20mm max, filled'
            R.td null, '30mm max, filled'
          R.tr null,
            R.th null, 'Pin knots'
            R.td null, NA
            R.td null, 'Allowed 2/board'
            R.td null, 'Allowed 3/board'
            R.td null, 'No limits'
          R.tr null,
            R.th null, 'Ring shake'
            R.td null, NA
            R.td null, NA
            R.td null, NA
            R.td null, A
          R.tr null,
            R.th null, 'End cracks'
            R.td null, NA
            R.td null, NA
            R.td null, NA
            R.td null, A
          R.tr null,
            R.th null, 'Surface cracks'
            R.td null, NA
            R.td null, NA
            R.td null, NA
            R.td null, A
          R.tr null,
            R.th null, 'Smooth tight burls'
            R.td null, NA
            R.td null, '10% of length allowed'
            R.td null, 'Unlimited'
            R.td null, 'Unlimited'
          R.tr null,
            R.th null, 'Holes'
            R.td null, NA
            R.td null, '2mm max, 3 well filled/meter'
            R.td null, NA
            R.td null, A
          R.tr null,
            R.th null, 'Bark Pockets'
            R.td null, '20mm by 1.5mm max'
            R.td null, '30mm by 3mm max'
            R.td null, '40mm by 5mm max'
            R.td null, A
          R.tr null,
            R.th null, 'Sticks'
            R.td null, NA
            R.td null, NA
            R.td null, 'Light'
            R.td null, 'Light'
          R.tr null,
            R.th null, 'Edge breakage'
            R.td null, NA
            R.td null, NA
            R.td null, NA
            R.td null, NA
          R.tr null,
            R.th null, 'Corner breakage'
            R.td null, NA
            R.td null, NA
            R.td null, NA
            R.td null, NA
          R.tr null,
            R.th null, 'Rot'
            R.td null, NA
            R.td null, NA
            R.td null, NA
            R.td null, NA
          R.tr null,
            R.th null, 'Mineral streaks'
            R.td null, NA
            R.td null, A
            R.td null, A
            R.td null, A
          R.tr null,
            R.th null, 'Stain'
            R.td null, 'Must blend with finished color'
            R.td null, 'Must blend with finished color'
            R.td null, 'Must blend with finished color'
            R.td null, 'Must blend with finished color'
          R.tr null,
            R.th null, 'Heartwood pith'
            R.td null, NA
            R.td null, A
            R.td null, A
            R.td null, A
          R.tr null,
            R.th null, 'Sapwood'
            R.td null, NA
            R.td null, '15% of width allowed'
            R.td null, A
            R.td null, A
          R.tr null,
            R.th null, 'Natural grain patterns'
            R.td null, 'Regular grain'
            R.td null, 'Allowed for any non-defects in grain'
            R.td null, 'Allowed for any non-defects in grain'
            R.td null, 'Allowed for any non-defects in grain'
          R.tr null,
            R.th null, 'Water mark'
            R.td null, NA
            R.td null, NA
            R.td null, 'Non-obvious dark marks'
            R.td null, 'Non-obvious dark marks'
          R.tr null,
            R.th null, 'Color change'
            R.td null, NA
            R.td null, 'Slight chemical change'
            R.td null, 'Non-heavy chemical change'
            R.td null, 'Non-heavy chemical change'
          R.tr null,
            R.th null, 'Heartwood pith'
            R.td null, 'Natural color variations'
            R.td null, 'Non-obvious color variations'
            R.td null, 'Non-extreme color variations'
            R.td null, 'All color variation'

      R.h2 null, 'Manufacturing Defects'
      R.p null,
        'URBANIA production standards also '
        R.strong null, 'DO NOT'
        ' allow for the following manufacturing defects across all grades:'

      R.ul className: 'columns',
        for defect, i in @defects
          R.li key: i, defect
