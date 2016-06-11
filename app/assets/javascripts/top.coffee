# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

markers = []
infoWindows = []

$ ->
	# Scroll
	scroll = () ->
		target = $(this.hash)
		targetY = target.offset().top - 100
		$('html,body').animate {scrollTop: targetY}, 500, 'swing'
		window.history.pushState null, null, this.hash
		return false
	$('.scroll').click(scroll)



	# Google Maps
	options = {zoom: 1, center: new google.maps.LatLng 39, 138}
	map = new google.maps.Map $('#map')[0], options

	# Google Mapsにマーカーセット
	_.each $('.marker-datum'), (markerDatum, index) ->
		data = $ markerDatum

		# マーカー生成
		place = new google.maps.LatLng data.attr('lat'), data.attr('lng') 
		marker = new google.maps.Marker {map: map, position: place}
		markers.push marker
		
		# 吹き出し生成
		content = '<a href="universities/' + data.attr('value') + '">' + data.attr('name_en') + '<br/>' + data.attr('name_ja') + '</a>'
		infoWindows.push(new google.maps.InfoWindow({content: content}))

		#　クリックで吹き出しが出るようにする
		marker.addListener 'click', ->
			_.each infoWindows, (info) -> info.close() 
			infoWindows[index].open map, markers[index]



	# People
	seeOthers = () ->
		people = $('.person_container')
		_.each people, (person) -> $(person).css({"display": "none"})
		_.each _.shuffle(people).slice(0,3), (person) -> $(person).fadeIn()

	$('#see-others').click(seeOthers)
	seeOthers()