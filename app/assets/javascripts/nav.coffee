$(document).on 'turbolinks:load', ->
    
    if top.location.pathname == '/'
        # Initialize boundary of featured section
        featuredBottom = $('.featured').offset().top + $('.featured').height() - $('.topnav').height()

        # Recalculate boundary of feature section on window resize
        $(window).resize ->
            featuredBottom = $('.featured').offset().top + $('.featured').height() - $('.topnav').height()

        # Initialize navbar at page load
        $('.topnav-main').hide()
        $('.topnav-featured').show()

        # Change navbar styling when scroll reaches bottom of featured image
        $(window).scroll ->
            windowTop = Math.round($(window).scrollTop())
            if windowTop < featuredBottom
                $('.topnav-main').fadeOut(500)
                $('.topnav-featured').fadeIn(500)
            if windowTop >= featuredBottom
                $('.topnav-featured').fadeOut(500)
                $('.topnav-main').fadeIn(500)
    else
        $('.topnav-featured').hide()
        $('.topnav-main').show()

    # Open sidenav on button click
    $('.open-sidenav').click ->
        $('.sidenav-mask').addClass 'is-active'
        $('.sidenav').css 'width', '250px'

    # Close sidenav on button click
    $('.close-sidenav').click ->
        $('.sidenav-mask').removeClass 'is-active'
        $('.sidenav').css 'width', '0'
    
    # Close sidenav on window resize
    $(window).resize ->
        if window.matchMedia('(min-width: 992px)').matches 
            $('.sidenav-mask').removeClass 'is-active' 
            $('.sidenav').css 'width', '0'


$(document).on 'turbolinks:before-cache', ->
    # Close sidenav prior to caching
    $('.sidenav-mask').removeClass 'is-active'
    $('.sidenav').css 'width', '0'