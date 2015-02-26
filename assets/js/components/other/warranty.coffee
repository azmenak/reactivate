React = require 'react'

R = React.DOM
div = R.div
ul = R.ul
li = R.li
p = R.p

module.exports = React.createFactory React.createClass
  displayName: 'Warranty'

  render: ->
    div className: 'info warranty',
      R.h2 null, 'Residential Warranty'
      p null, 'Urbania Canada floors finishes are warrantied for 25 years
      in residential installations. The structure of Urbania Flooring is
      warrantied for Life. These warranties are conditional on the
      following:'

      ul null,
        li null, 'The product is installed according to the “Engineered
        Hardwood Flooring Installation Guide for Urbania Canada Flooring”.
        Note we provide a hard copy of these instructions in every 3rd box
        of flooring. '
        li null, 'The product is installed in an environment where the
        ambient moisture content is controlled within the range of 25% -
        70%.'

      R.h3 null, 'Warranty Details:'
      p null, 'Lacquer Finish Warranty – Urbania warrants the coating
      against wear through for 25 years in residential applications.
      Abusive conditions are not covered by this warranty, they include
      the following:'
      ul null,
        li null,
          R.strong null, 'Moist Conditions'
          ', exposure to more than the casual moisture associated with
          regular cleaning.'
        li null,
          R.strong null, 'Faulty Maintenance'
          ', daily wet mopping (bucket & mop) is not recommended and
          damage due to excess exposure to moisture from wet mopping is
          not covered by this warranty. The use of a micro-fiber pad plus
          flooring cleaning agent is an approved method of maintenance or
          cleaning.'
        li null,
          R.strong null, 'Pet Damage'
          ', scratches, surface gouges or any other type of damage caused
          by household pets are not covered by this warranty.'

      p null, 'Scratches, Gouges or Impact Damage are considered
      day-to-day wear and tear and are not considered a manufacturing
      defect and thus are not covered by this warranty.'

      p null, 'Colour Fade associated with exposure to sunlight or
      artificial light is an inherent property of wood and not considered
      a manufacturing defect and thus is not covered by this warranty.'

      p null, 'Lifetime Structural Warranty – Urbania Canada warrants that
      your product is free from manufacturing structural defects and will
      remain free of these defects for as long as you own your residence.'
