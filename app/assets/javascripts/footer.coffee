$(document).on 'turbolinks:load', ->
	if $('.landing').length > 0 then $('footer').hide() else $('footer').show()