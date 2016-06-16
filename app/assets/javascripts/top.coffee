# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

markers = []
infoWindows = []
openedWindow = null

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
	options = {zoom: 2, center: new google.maps.LatLng 39, 138}
	map = new google.maps.Map $('#map')[0], options

	# Google Mapsにマーカーセット
	_.each $('.marker_datum'), (markerDatum, index) ->
		data = $(markerDatum)

		# マーカー生成
		place = new google.maps.LatLng data.attr('lat'), data.attr('lng') 
		marker = new google.maps.Marker {map: map, position: place}
		markers.push marker
		
		# 吹き出し生成
		infoWindows.push(new google.maps.InfoWindow({content: markerDatum}))

		#　クリックで吹き出しが出るようにする
		marker.addListener 'click', ->
			openedWindow.close() if openedWindow
			openedWindow = infoWindows[index]
			openedWindow.open map, markers[index]
			
			xhr = new XMLHttpRequest()
			xhr.responseType = "blob"
			xhr.open("GET", "/universities/" + data.attr('value') + "/get_photo?num=0")
			xhr.onload = () ->
				if this.status == 200
					imgURL = URL.createObjectURL(this.response)
					image = new Image()
					image.src = imgURL
					image.onload = () -> URL.revokeObjectURL(imgURL)
				else
					image = $(".no-image").clone(true)
				
				link = $("<a></a>", {href: "/universities/" + data.attr('value')})
				link.append(image)
				data.children(".baloon").children(".image_sizer").append(link)
			xhr.send(null)



	# People
	seeOthers = () ->
		people = $('.person_container')
		_.each people, (person) -> $(person).css({"display": "none"})
		_.each _.shuffle(people).slice(0,3), (person) -> $(person).fadeIn()

	$('#see-others').click(seeOthers)
	seeOthers()