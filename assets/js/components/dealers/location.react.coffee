React = require 'react'
parseForm = require '../../utils/parseForm'
formaters = require '../../utils/formaters'
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

  geocode: (event) ->
    GoogleMapsLoader ?= require 'google-maps'

    event.preventDefault()
    @setState
      status: @STATUSES.LOCATING
    address = parseForm(event.target).address

    GoogleMapsLoader.load (google) =>
      ReactGoogleMaps ?= require 'react-googlemaps'

      Map ?= ReactGoogleMaps.Map
      Marker ?= ReactGoogleMaps.Marker
      OverlayView ?= ReactGoogleMaps.OverlayView
      geo = new google.maps.Geocoder()
      geo.geocode {address, region: 'CA'}, (results) =>
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
          console.log matrix
          stores = matrix.rows[0].elements
          sortedStores = stores.slice(0)
          sortedStores.sort (a, b) ->
            if a.distance.value < b.distance.value then -1
            else if a.distance.value is b.distance.value then 0
            else 1
          i = stores.indexOf(sortedStores[0])
          closestStore = data.stores[i]

          getCentrePoint = (orig, dest) ->
            [south, north] = if orig.lat < dest.lat
              [orig.lat, dest.lat]
            else
              [dest.lat, orig.lat]
            [west, east] = if orig.lng < dest.lng
              [orig.lng, dest.lng]
            else
              [dest.lng, orig.lng]
            southWest = new google.maps.LatLng(south, west)
            northEast = new google.maps.LatLng(north, east)
            bounds = new google.maps.LatLngBounds(southWest, northEast)
            bounds.getCenter()

          centre = getCentrePoint
            lat: closestStore.lat
            lng: closestStore.lng
          ,
            lat: location.lat()
            lng: location.lng()

          @setState
            distance: sortedStores[0].distance.text
            status: @STATUSES.FOUND
            store: closestStore
            centre: centre

  render: ->
    div className: 'location-finder',
      R.form
        ref: 'locationForm'
        onSubmit: @geocode
      ,
        R.input
          name: 'address'
          ref: 'locationInput'
          placeholder: 'Enter your Address or Postal Code'

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

      div className: 'formated-address',
        if @state.status in [@STATUSES.FOUND, @STATUSES.SEARCHING]
          R.p null, @state.address

      div className: 'dealer',
        if @state.status is @STATUSES.FOUND
          [
            R.h3 null, @state.store.name
            R.p
              className: 'store-address'
              dangerouslySetInnerHTML:
                __html:
                  """
                    #{@state.store.address} <br />
                    #{@state.store.city}, #{@state.store.state}.
                    #{formaters.zipPostal(@state.store.zipPostal)}
                  """
            div className: 'distance',
              R.p null, "Distance: #{@state.distance}"
          ]

      div className: 'map',
        if @state.status is @STATUSES.FOUND
          Map
            initialZoom: 10
            initialCenter: @state.centre
            width: 600
            height: 400
          ,
            Marker
              position: new google.maps.LatLng(@state.lat, @state.lng)

