$ ->
	# Article
	$('.select_article').click(() ->
		_.each $('.article_container'), (article) -> $(article).css({"display": "none"})
		category = $(this).attr("value")
		_.each $('.article_container'), (article) -> 
			$(article).fadeIn() if !category or $(article).attr("value") == category
	)