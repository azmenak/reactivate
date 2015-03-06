# Reactivate

Static site built using isomorphic react, a completley
over-engineered client project.

Not quite ready for prime-time as an engine, still need to work out the
kinks in making the development a bit smoother. Also going to strip the
content of the site later for re-use.

### Stack
- Facebook's [ReactJS](http://facebook.github.io/react/) for rendering on client and build
- Using the excellent [React-Router](https://github.com/rackt/react-router) for routing on both sides as well
- [Browserify](http://browserify.org/) for component management
- 100% free of jQuery because [you don't need it](http://youmightnotneedjquery.com)
- [Gulp](http://gulpjs.com/) for building, serving, etc., used to use
  [roots.cx](http://roots.cx), but it was geared more towards template based static sites
- Now includes cache-busting use [gulp-rev](https://github.com/sindresorhus/gulp-rev)
- [Stylus](http://learnboost.github.io/stylus/) for CSS pre-processing since I wanted to try it (it's really nice, highly recommend over SASS)
- [LWIP](https://github.com/EyalAr/lwip) to process images into the various required sizes
- [Jade](http://jade-lang.com/) for a single layout file to make life slightly easier
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
