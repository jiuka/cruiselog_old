# Singleton Icon Creator for LeafletJS

@getPortIcon =->
  @portIcon ?= L.divIcon
    className: 'none'
    html: '<i class="inverted circular anchor icon"></i>'
    size: L.point 24, 24
    iconAnchor: L.point 12, 12

@getActivePortIcon = ->
  @portIconActive ?= L.divIcon
    className: 'none'
    html: '<i class="inverted circular red anchor icon"></i>'
    size: L.point 24, 24
    iconAnchor: L.point 12, 12

@getMoveIcon = ->
  @moveIcon ?= L.divIcon
    className: 'none'
    html: '<i class="inverted circular mini fullscreen icon"></i>'
    size: L.point 24, 24
    iconAnchor: L.point 12, 12

@getAddIcon ?= ->
  @addIcon = L.divIcon
    className: 'none'
    html: '<i class="inverted circular mini add icon"></i>'
    size: L.point 24, 24
    iconAnchor: L.point 12, 12
