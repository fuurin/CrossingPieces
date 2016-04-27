# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	# Append photo form button
	

	# Google Maps
	marker = null
	options = {zoom: 1, center: new google.maps.LatLng 39, 138}
	map = new google.maps.Map $('#map-input').get(0), options
	google.maps.event.addListener map, 'click', (e) ->
		marker.setMap null if marker
		place = new google.maps.LatLng e.latLng.lat(), e.latLng.lng()
		marker = new google.maps.Marker {map: map, position: place}
		$('#university_map_lat').val place.lat()
		$('#university_map_lng').val place.lng()
	google.maps.event.addListener map, 'zoom_changed', ->
		$('#university_map_zoom').val map.getZoom()