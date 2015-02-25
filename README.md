# Reactivate

Static site built using isomorphic react, a completley
over-engineered client project.

Not quite ready for prime-time as an engine, still need to work out the
kinks in making the development and deployment a bit smoother

### Stack
- Facebook's ReactJS for rendering on client and build
- Using the excellent React-Router for routing on both sides as well
- Browserify for component management
- 100% free of jQuery because [you don't need
  it](http://youmightnotneedjquery.com)
- Gulp for building, serving, etc., used to use
  [roots.cx](http://roots.cx), but it was geared more towards template
based static sites
- Stylus for CSS pre-processing since I wanted to try it (it's
  really nice, highly recommend)
- LWIP to process images into the various required sizes
- Jade for a single layout file to make life slightly easier
- gh-pages for hosting with cloudflare managing the DNS and some extra
  caching

### Setup

- make sure [node.js](http://nodejs.org) is installed
- clone this repo down and `cd` into the folder
- run `npm install`
- run `gulp serve`
- ???
- get money

### Other Comands
- run `npm link` first
- `imagemake` [--images] will create exports of the needed images
- `reactivate` will read `routes.coffee` and create the required
  static HTML files

### Deploying

- `gulp build` to create a serveable build
- Use `NODE_ENV=production` for production ready builds
- Deploy to gh-pages using `gulp deploy`
