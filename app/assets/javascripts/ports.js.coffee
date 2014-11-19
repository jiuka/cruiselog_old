# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@portIcon = L.divIcon { className: 'none', html: '<i class="inverted circular anchor icon"></i>' }
@portIconActive = L.divIcon { className: 'none', html: '<i class="inverted circular red anchor icon"></i>' }

@portMarkers = []

@panToPort = (port) ->
  for id,marker of portMarkers
    marker.setIcon portIcon
  portMarkers[port.id].setIcon portIconActive
  map.panTo [port.latitude, port.longitude], {animate: true}
  return false

@addPortMarker = (port) ->
  m = L.marker [port.latitude, port.longitude], {icon: @portIcon}
  portMarkers[port.id] = m
  m.bindPopup('Port of ' + port.title);
  $('#link_port_' + port.id).bind 'click', (event) -> 
    panToPort port
  m.addTo(map);

@editPort = (port) ->
  portMarkers[port.id].dragging.enable()
  map.panTo([port.latitude, port.longitude])
  portMarkers[port.id].on('drag', markerDrag);

@markerDrag = (e) ->
  $('#port_location').attr('value',e.target._latlng.lat.toFixed(5) + 'N ' + e.target._latlng.lng.toFixed(5) + 'E')

@newPort = () ->
  port =
    id: 0,
    latitude: map.getCenter().lat
    longitude: map.getCenter().lng
    title: 'NEW'
  addPortMarker port
  editPort port

  map.on 'click', (e) ->
    portMarkers[0].setLatLng e.latlng
    $('#port_location').attr 'value', e.latlng.lat.toFixed(5) + 'N ' + e.latlng.lng.toFixed(5) + 'E'

