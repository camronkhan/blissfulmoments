$(document).on 'turbolinks:load', ->
	# Open sidenav on button click
	$('.open-sidenav').click ->
		$('.sidenav-mask').addClass('is-active')
		$('.sidenav').css('width', '250px')
	# Close sidenav on button click
	$('.close-sidenav').click ->
		$('.sidenav-mask').removeClass('is-active')
		$('.sidenav').css('width', '0')
	# Close sidenav on window resize
	$(window).resize ->
        if window.matchMedia('(min-width: 992px)').matches 
        	$('.sidenav-mask').removeClass('is-active')
        	$('.sidenav').css('width', '0')

$(document).on 'turbolinks:before-cache', ->
	# Close sidenav prior to caching
	$('.sidenav-mask').removeClass('is-active')
	$('.sidenav').css('width', '0')