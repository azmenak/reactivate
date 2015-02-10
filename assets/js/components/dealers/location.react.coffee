React = require 'react'
Cx = require 'react/lib/cx'
GmapsDirectionLink = require './gmaps-directions.react'

parseForm = require '../../utils/parse-form'
formaters = require '../../utils/formaters'
mapsUtils = require '../../utils/maps-utils'
data = require '../../data'

R = React.DOM
div = R.div

GoogleMapsLoader = null
ReactGoogleMaps = null
Map = null
Marker = null
OverlayView = null

module.exports = React.createFactory React.createClass
  displayName: 'Location Finder'

  MAP_HEIGHT: 300

  STATUSES:
    INIT: 0
    LOCATING: 1
    SEARCHING: 2
    FOUND: 3
    NOTFOUND: 4

  getInitialState: ->
    status: @STATUSES.INIT
    lat: null
    lng: null
    distance: null
    store: null
    address: null
    geo: null
    isMobile: false

  componentDidMount: ->
    @refs['locationInput'].getDOMNode().focus()
    if window.orientation?
      @setState
        isMobile: true
    #navigator.geolocation.getCurrentPosition (position) =>
      #return unless @isMounted()
      #@crd = position.coords

  geocode: (event) ->
    GoogleMapsLoader ?= require 'google-maps'
    event.preventDefault()

    address = parseForm(event.target).address.trim()
    return if address.length is 0

    @setState
      status: @STATUSES.LOCATING

    GoogleMapsLoader.load (google) =>
      ReactGoogleMaps ?= require 'react-googlemaps'

      Map ?= React.createFactory ReactGoogleMaps.Map
      Marker ?= React.createFactory ReactGoogleMaps.Marker
      OverlayView ?= React.createFactory ReactGoogleMaps.OverlayView
      geo = new google.maps.Geocoder()
      geo.geocode {address, region: 'CA'}, (results) =>
        return unless @isMounted()
        if results.length is 0
          @setState status: @STATUSES.NOTFOUND
          return
        location = results[0].geometry.location
        @setState
          status: @STATUSES.SEARCHING
          address: results[0].formatted_address
          lat: location.lat()
          lng: location.lng()
        distanceMatrix = new google.maps.DistanceMatrixService()
        storeLocations = for store in data.stores
          new google.maps.LatLng store.lat, store.lng
        matrixRequest =
          avoidHighways: false
          avoidTolls: false
          region: 'CA'
          travelMode: google.maps.TravelMode.DRIVING
          unitSystem: google.maps.UnitSystem.METRIC
          origins: [location]
          destinations: storeLocations
        distanceMatrix.getDistanceMatrix matrixRequest, (matrix) =>
          return unless @isMounted()
          stores = matrix.rows[0].elements
          sortedStores = stores.slice(0)
          sortedStores.sort (a, b) ->
            if a.distance.value < b.distance.value then -1
            else if a.distance.value is b.distance.value then 0
            else 1
          i = stores.indexOf(sortedStores[0])
          closestStore = data.stores[i]

          bounds = mapsUtils.getBounds
            lat: closestStore.lat
            lng: closestStore.lng
          ,
            lat: location.lat()
            lng: location.lng()

          @setState
            distance: sortedStores[0].distance.text
            status: @STATUSES.FOUND
            store: closestStore
            centre: bounds.getCenter()
            zoom: mapsUtils.getBoundsZoomLevel bounds,
              width: @refs['mapContainer'].getDOMNode().offsetWidth
              height: @MAP_HEIGHT

  render: ->
    canSearch = not (@state.status in [@STATUSES.LOCATING, @STATUSES.SEARCHING])

    div className: 'location-finder',
      R.form
        ref: 'locationForm'
        onSubmit: @geocode
      ,
        div className: 'form-group',
          R.label for: 'address', "Your address or Postal Code"
          R.input
            className: 'form-control'
            name: 'address'
            ref: 'locationInput'
            placeholder: 'Enter your Address or Postal Code'
          R.button
            className: 'search-button btn hint--top hint--rounded'
            type: 'submit'
            'data-hint': if canSearch then 'Search' else 'Searching'
          ,
            R.i
              className: Cx
                'fa hint--bottom': true
                'fa-chevron-circle-right': canSearch
                'fa-circle-o-notch fa-spin': !canSearch

      div className: 'u-grid',
        div className: 'u-left',
          div className: 'formated-address',
            if @state.status in [@STATUSES.FOUND, @STATUSES.SEARCHING]
              addr: R.p className: 'addr', @state.address

          div className: 'status',
            if @state.status
              R.p null,
                switch @state.status
                  when @STATUSES.LOCATING
                    'Locating your address...'
                  when @STATUSES.SEARCHING
                    'Searching for your URBANIA dealer...'
                  when @STATUSES.FOUND
                    'Here is your URBANIA dealer:'
                  when @STATUSES.NOTFOUND
                    'Could not find a location for that address'


          div className: 'dealer',
            if @state.status is @STATUSES.FOUND
              header:
                R.h3 null, @state.store.name
              directions:
                R.p null,
                  GmapsDirectionLink
                    saddr: "#{@state.lat},#{@state.lng}"
                    daddr: "#{@state.store.address},
                            #{@state.store.city}, #{@state.store.state}"
              addr:
                R.p
                  className: 'store-address addr'
                  dangerouslySetInnerHTML:
                    __html:
                      """
                        #{@state.store.address} <br />
                        #{@state.store.city}, #{@state.store.state}.
                        #{formaters.zipPostal(@state.store.zipPostal)}
                      """
              phone:
                if @state.store.phone?
                  R.p className: 'vcard',
                    'Phone: '
                    R.a
                      className: 'tel'
                      href: "tel:+1#{@state.store.phone}"
                    , formaters.phoneNumber @state.store.phone
              website:
                if @state.store.website?
                  R.p className: 'website',
                    'Website: '
                    R.a
                      className: 'website'
                      href: @state.store.website
                      target: '_blank'
                    , formaters.webAddr @state.store.website

              distance:
                div className: 'distance',
                  R.p null, "Driving distance: #{@state.distance}"

        div className: 'u-right',
          div className: 'map', ref: 'mapContainer',
            if @state.status is @STATUSES.FOUND
              Map
                initialZoom: @state.zoom
                initialCenter: @state.centre
                width: @refs['mapContainer'].getDOMNode().offsetWidth
                height: @MAP_HEIGHT
              ,
                Marker
                  position: new google.maps.LatLng(@state.lat, @state.lng)
                Marker
                  position: new google.maps.LatLng(@state.store.lat,
                    @state.store.lng)

