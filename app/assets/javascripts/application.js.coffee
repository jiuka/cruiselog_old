# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require leaflet
#= require leaflet-editable-polyline
#= require_tree .

exports = this

getCookie = (c_name) ->
  if (document.cookie.length > 0)
    c_start = document.cookie.indexOf(c_name + "=");
    if (c_start != -1)
      c_start = c_start + c_name.length + 1;
      c_end = document.cookie.indexOf(";", c_start);
      if (c_end == -1)
        c_end = document.cookie.length;
      return unescape(document.cookie.substring(c_start, c_end));
  return "";

setCookie = (cname, cvalue, exdays) ->
    d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;

# Setup General Map
exports.clInitMap =  ->
  exports.map = L.map 'map'
  L.tileLayer 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    maxZoom: 18
   .addTo exports.map
   lat  = if getCookie("lat" ) then getCookie("lat" ) else 49.5
   lon  = if getCookie("lon" ) then getCookie("lon" ) else 8.6
   zoom = if getCookie("zoom") then getCookie("zoom") else 7
   exports.map.setView [lat, lon], zoom
   exports.map.on 'moveend', () ->
     clSavePosition()

clSavePosition = ->
    setCookie 'cl_lat', map.getCenter().lat, 64
    setCookie 'cl_lon', map.getCenter().lng, 64
    setCookie 'cl_zoom', map.getZoom(), 64
