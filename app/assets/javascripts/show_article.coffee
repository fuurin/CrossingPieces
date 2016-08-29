$ ->
	# Article
	$('.select_article').click(() ->
		_.each $('.article_container'), (article) -> $(article).css({"display": "none"})
		category = $(this).attr("value")
		_.each $('.article_container'), (article) -> 
			$(article).fadeIn() if !category or $(article).attr("value") == category
	)

d = document
s = 'script'
id = 'jacebook-jssdk'

do (d, s, id) ->
	if d.getElementById(id)
		return
	fjs = d.getElementsByTagName(s)[0]
	js = d.createElement(s)
	js.id = id
	js.src = "//connect.facebook.net/ja_JP/sdk.js#xfbml=1&version=v2.7"
	fjs.parentNode.insertBefore(js, fjs)