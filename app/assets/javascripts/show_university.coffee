# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	# Article
	$('.select_article').click(() ->
		_.each $('.article_container'), (article) -> $(article).css({"display": "none"})
		category = $(this).attr("value")
		_.each $('.article_container'), (article) -> 
			$(article).fadeIn() if !category or $(article).attr("value") == category
	)