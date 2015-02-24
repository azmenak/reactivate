#! /usr/bin/env coffee
console.time 'TOTAL TIME'
process.on 'exit', (code) ->
  console.log '\n'
  console.timeEnd 'TOTAL TIME'

userArgs = process.argv.slice 2
createSets      = require 'cli/create-sets'

if '--all' in userArgs
  sets =
    sublime: 'productSet'
    gallery: 'gallerySet'
    stock: 'stockSet'
  for key, value of sets
    createSets key, value

if '--sublime' in userArgs
  createSets 'sublime', 'productSet'

if '--gallery' in userArgs
  createSets 'gallery', 'gallerySet'

if '--stock' in userArgs
  createSets 'stock', 'stockSet'
