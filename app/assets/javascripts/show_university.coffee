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

	# Article
	articles = $('.article')

	showNewArticle = (category) -> 
		if category == ""
			_.each articles, (article) ->	$(article).fadeIn()
			return
		_.each articles, (article) -> 
			$(article).fadeIn() if $(article).attr("value") == category

	selectArticle = () ->
		_.each articles, (article) -> $(article).css({"display": "none"})
		showNewArticle $(this).attr("value")

	$('.select_article').click(selectArticle)