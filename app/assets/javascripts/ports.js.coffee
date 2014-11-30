# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@panToPort = (port) ->
  for id,marker of map.portMarkers
    marker.setIcon getPortIcon()
  map.portMarkers[port.id].setIcon getActivePortIcon()
  map.panTo [port.latitude, port.longitude], {animate: true}
  return false

@addPortMarker = (port) ->
  map.portMarkers ?= []
  if map.portMarkers[port.id]?
    return map.portMarkers[port.id].addTo(map);
  m = L.marker [port.latitude, port.longitude], {icon: getPortIcon()}
  map.portMarkers[port.id] = m
  m.bindPopup('Port of ' + port.title);
  $('#link_port_' + port.id).bind 'click', (event) -> 
    panToPort port
  m.addTo(map);

@editPort = (port) ->
  map.portMarkers[port.id].dragging.enable()
  map.panTo([port.latitude, port.longitude])
  map.portMarkers[port.id].on('drag', markerDrag);

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
    map.portMarkers[0].setLatLng e.latlng
    $('#port_location').attr 'value', e.latlng.lat.toFixed(5) + 'N ' + e.latlng.lng.toFixed(5) + 'E'

