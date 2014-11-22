# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


@segmentMarkerMove = L.divIcon { className: 'none', html: '<i class="inverted circular mini fullscreen icon"></i>' }
@segmentMarkerAdd = L.divIcon { className: 'none', html: '<i class="inverted circular mini add icon"></i>', size: L.point(24, 24), iconAnchor: L.point(12, 12) }

@cruiseSegments = {}

@addCruiseSegment = (name, points) ->
  pl = new CruiseSegment points
  cruiseSegments[name] = pl

@editCruiseSegment = (name) ->
  cruiseSegments[name].edit()

# Segment Editor
class CruiseSegment extends L.Polyline

  constructor: (points) ->
    @line = L.polyline points, {}
    @line.addTo map
    @markers = []

  edit: ->
    @line.setStyle {color: '#f30'}

    points = @line.getLatLngs()
    for idx in [0..points.length-1]
      console.log @markers
      if idx > 0
        lat = (points[idx].lat + points[idx-1].lat) / 2
        lng = (points[idx].lng + points[idx-1].lng) / 2
        @addMiddleMarker @markers.length, [lat, lng]
      console.log @markers
      if idx == 0 or idx == points.length-1
        @addPortMarker @markers.lengt, points[idx]
      else
        @addPointMarker @markers.lengt, points[idx]
    console.log @markers

  update: ->
    latlngs = []
    for marker in @markers by 2
      latlngs.push marker.getLatLng()
    @line.setLatLngs latlngs
    $('#cruise_segment_route').attr 'value', latlngs

  addPortMarker: (idx, latlng) ->
    m = L.marker latlng, {icon: portIcon}
    @markers.push m
    m.addTo map

  addPointMarker: (idx, latlng) ->
    m = L.marker latlng, {icon: segmentMarkerMove, draggable: true}
    @markers.push m
    m.on 'drag', @pointMoved.bind this
    m.addTo map

  pointMoved: (e) ->
    idx = @markers.indexOf(e.target)
    console.log idx, @markers
    latlng = @_latLngMiddle @markers[idx].getLatLng(), @markers[idx+2].getLatLng()
    @markers[idx+1].setLatLng latlng
    latlng = @_latLngMiddle @markers[idx-2].getLatLng(), @markers[idx].getLatLng()
    @markers[idx-1].setLatLng latlng
    @update()

  middleToPoint: (e) ->
    idx = @markers.indexOf(e.target)

    # Set new Icon
    @markers[idx].setIcon segmentMarkerMove

    # Add Marker behind
    latlng = @_latLngMiddle @markers[idx].getLatLng(), @markers[idx+1].getLatLng()
    @addMiddleMarker idx+1, latlng

    # Add Marker infront
    latlng = @_latLngMiddle @markers[idx-1].getLatLng(), @markers[idx].getLatLng()
    @addMiddleMarker idx, latlng

    @update()

  addMiddleMarker: (idx, latlng) ->
    m = L.marker latlng, {icon: segmentMarkerAdd, draggable: true}
    @markers.splice idx, 0, m
    m.once 'dragstart', @middleToPoint.bind this
    m.on 'drag', @pointMoved.bind this
    m.addTo map

  _latLngMiddle: (a, b) ->
    lat = (a.lat + b.lat) / 2
    lng = (a.lng + b.lng) / 2
    [lat, lng]


