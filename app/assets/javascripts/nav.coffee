$(document).on 'turbolinks:load', ->
    console.log "$(document).on 'turbolinks:load', ->"

    if $('.landing').length > 0
        console.log "$('.landing').length > 0"

        $('.topnav-main').hide()
        topnavMainIsActive = false
        $('.topnav-flickity').hide()
        topnavFlickityIsActive = false
        console.log "topnav-main: hidden, topnav-flickity: hidden, topnavMainIsActive: " + topnavMainIsActive + ", topnavFlickityIsActive: " + topnavFlickityIsActive

    else if $('.flickity').length > 0
        console.log "$('.flickity').length > 0"

        # Initialize navbar at page load
        $('.topnav-main').hide()
        topnavMainIsActive = false
        $('.topnav-flickity').show()
        topnavFlickityIsActive = true
        console.log "topnav-main: hidden, topnav-flickity: shown, topnavMainIsActive: " + topnavMainIsActive + ", topnavFlickityIsActive: " + topnavFlickityIsActive

        # Initialize boundary of flickity section
        flickityBottom = $('.flickity').offset().top + $('.flickity').height() - $('.topnav').height()
        console.log "flickityBottom: " + flickityBottom

    else
        console.log "$('.flickity').length == 0"
        $('.topnav-main').show()
        $('.topnav-flickity').hide()
        topnavFlickityIsActive = false
        console.log "topnav-main: shown, topnav-flickity: hidden, topnavFlickityIsActive: " + topnavFlickityIsActive

    # Recalculate boundary of feature section on window resize
    $(window).resize ->
        console.log "$(window).resize ->"

        if $('.flickity').length > 0
            console.log "$('.flickity').length > 0"

            flickityBottom = $('.flickity').offset().top + $('.flickity').height() - $('.topnav').height()
            console.log "resized flickityBottom: " + flickityBottom

        if window.matchMedia('(min-width: 992px)').matches
            console.log "window.matchMedia('(min-width: 992px)').matches"

            $('.sidenav-mask').removeClass 'is-active' 
            $('.sidenav').css 'width', '0'
            console.log "Closing sidenav"

    # Change navbar styling when scroll reaches bottom of flickity image
    $(window).scroll ->
        console.log "$(window).scroll ->"

        if $('.flickity').length > 0
            console.log "$('.flickity').length > 0"

            windowTop = Math.round($(window).scrollTop())
            console.log "windowTop: " + windowTop

            if windowTop < flickityBottom
                console.log "windowTop < flickityBottom"

                if topnavMainIsActive
                    console.log "topnavMainIsActive: " + topnavMainIsActive

                    $('.topnav-main').fadeOut(500)
                    topnavMainIsActive = false
                    $('.topnav-flickity').fadeIn(500)
                    topnavFlickityIsActive = true
                    console.log "topnav-main: fadeOut, topnav-flickity: fadeIn, topnavMainIsActive: " + topnavMainIsActive + ", topnavFlickityIsActive: " + topnavFlickityIsActive

            else
                console.log "windowTop >= flickityBottom"

                if topnavFlickityIsActive
                    console.log "topnavFlickityIsActive: " + topnavFlickityIsActive

                    $('.topnav-flickity').fadeOut(500)
                    topnavFlickityIsActive = false
                    $('.topnav-main').fadeIn(500)
                    topnavMainIsActive = true
                    console.log "topnav-main: fadeIn, topnav-flickity: fadeOut, topnavMainIsActive: " + topnavMainIsActive + ", topnavFlickityIsActive: " + topnavFlickityIsActive

    # Open sidenav on button click
    $('.open-sidenav').click ->
        $('.sidenav-mask').addClass 'is-active'
        $('.sidenav').css 'width', '250px'

    # Close sidenav on button click
    $('.close-sidenav').click ->
        $('.sidenav-mask').removeClass 'is-active'
        $('.sidenav').css 'width', '0'


$(document).on 'turbolinks:before-cache', ->
    $('.sidenav-mask').removeClass 'is-active'
    $('.sidenav').css 'width', '0'