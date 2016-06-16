# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

markers = []
infoWindows = []
openedWindow = null

$ ->
	# Article
	$('.select_article').click(() ->
		_.each $('.article_container'), (article) -> $(article).css({"display": "none"})
		category = $(this).attr("value")
		_.each $('.article_container'), (article) -> 
			$(article).fadeIn() if !category or $(article).attr("value") == category
	)


	# Google Maps
	mapObj = $('#map')
	lat = parseFloat mapObj.attr('lat')
	lng = parseFloat mapObj.attr('lng')
	zoom = parseInt(mapObj.attr('zoom'))
	options = { zoom: zoom, center: new google.maps.LatLng(lat, lng)}
	map = new google.maps.Map mapObj[0], options

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

			displayImage = (image) ->
				link = $("<a></a>", {href: "/universities/" + data.attr('value')})
				link.append(image)
				data.children(".baloon").children(".image_sizer").empty().append(link)

			displayImage($('.loading').clone('true'))

			xhr = new XMLHttpRequest()
			xhr.responseType = "blob"
			xhr.open("GET", "/universities/" + data.attr('value') + "/get_photo?num=0")
			xhr.onload = () ->
				return displayImage($('.no-image').clone('true')) if this.status != 200
				imgURL = URL.createObjectURL(this.response)
				image = new Image()
				image.src = imgURL
				image.onload = () -> URL.revokeObjectURL(imgURL)
				displayImage(image)
			xhr.send(null)
