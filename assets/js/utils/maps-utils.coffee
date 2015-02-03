GlobalMapsError = (message) ->
  @name = 'GlobalMapsMissing Error'
  @message = message or 'Mapping utilities require the google.maps object
                         on the global space'

GlobalMapsError:: = Object.create(Error::)
GlobalMapsError::constructor = GlobalMapsError

module.exports =
  getBounds: (orig, dest) ->
    unless google.maps?
      throw new GlobalMapsError()
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
    new google.maps.LatLngBounds(southWest, northEast)

  getBoundsZoomLevel: (bounds, mapDim, padding = 50) ->
    unless google.maps?
      throw new GlobalMapsError()
    WORLD =
      height: 256
      width: 256
    MAX = 21

    mapDim ?= {}
    mapDim.height ?= 640
    mapDim.width ?= 400

    mapDim.height -= padding
    mapDim.width -= padding

    latRad = (lat) ->
      sin = Math.sin(lat * Math.PI / 180)
      radX2 = Math.log((1 + sin) / (1 - sin)) / 2
      Math.max(Math.min(radX2, Math.PI), -Math.PI) / 2

    zoom = (mapPx, worldPx, fraction) ->
      Math.floor(Math.log(mapPx / worldPx / fraction) / Math.LN2)

    ne = bounds.getNorthEast()
    sw = bounds.getSouthWest()

    latFraction = (latRad(ne.lat()) - latRad(sw.lat())) / Math.PI
    lngDiff = ne.lng() - sw.lng()
    lngFraction = (if lngDiff < 0 then lngDiff + 360 else lngDiff) / 360

    latZoom = zoom(mapDim.height, WORLD.height, latFraction)
    lngZoom = zoom(mapDim.width, WORLD.width, lngFraction)

    console.log latZoom, lngZoom

    Math.min(latZoom, lngZoom, MAX)

