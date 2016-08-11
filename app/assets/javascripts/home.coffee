$(document).on 'turbolinks:load', ->
	
	# Create new carousel instance on turbolinks load
	$carousel = $('.carousel').flickity
		imagesLoaded: true
		autoPlay: 5000
		wrapAround: true

	# Carousel fades in after load
	$('.carousel').fadeTo 500, 1

	###
	$carousel = $('.carousel').flickity(
		imagesLoaded: true
		percentPosition: false)
	$imgs = $carousel.find('.carousel-cell img')
	# get transform property
	docStyle = document.documentElement.style
	transformProp = if typeof docStyle.transform == 'string' then 'transform' else 'WebkitTransform'
	# get Flickity instance
	flkty = $carousel.data('flickity')
	$carousel.on 'scroll.flickity', ->
		flkty.slides.forEach (slide, i) ->
			img = $imgs[i]
			x = (slide.target + flkty.x) * -1 / 3
			img.style[transformProp] = 'translateX(' + x + 'px)'
	###
	

$(document).on 'turbolinks:before-cache', ->
	# Destroy current carousel instance before caching
	$('.carousel').flickity 'destroy'
	$('.carousel').css
		opacity: 0