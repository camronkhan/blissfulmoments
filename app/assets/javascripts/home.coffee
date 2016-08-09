# Create new carousel instance on turbolinks load	https://github.com/turbolinks/turbolinks#running-javascript-when-a-page-loads
$(document).on 'turbolinks:load', ->
	$('.carousel').flickity
		imagesLoaded: true
		autoPlay: 5000
		wrapAround: true
	$('.carousel').fadeTo 500, 1

# Destroy current carousel instance before caching	https://github.com/turbolinks/turbolinks#preparing-the-page-to-be-cached
$(document).on 'turbolinks:before-cache', ->
	$('.carousel').flickity 'destroy'
	$('.carousel').css
		opacity: 0