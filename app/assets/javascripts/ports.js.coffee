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
