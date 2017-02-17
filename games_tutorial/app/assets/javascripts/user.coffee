ready = ->
	console.log('hello')

$(document).ready(ready)
$(document).on "page:load", ready