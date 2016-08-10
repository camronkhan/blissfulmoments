$(document).on 'turbolinks:load', ->
    console.log "$(document).on 'turbolinks:load', ->"

    topnavMainIsActive = true
    topnavFeaturedIsActive = true

    if $('.featured').length > 0
        console.log "$('.featured').length > 0"

        # Initialize navbar at page load
        $('.topnav-main').hide()
        topnavMainIsActive = false
        $('.topnav-featured').show()
        topnavFeaturedIsActive = true
        console.log "topnav-main: hidden, topnav-featured: shown, topnavMainIsActive: " + topnavMainIsActive + ", topnavFeaturedIsActive: " + topnavFeaturedIsActive

        # Initialize boundary of featured section
        featuredBottom = $('.featured').offset().top + $('.featured').height() - $('.topnav').height()
        console.log "featuredBottom: " + featuredBottom

    else
        console.log "$('.featured').length == 0"

        $('.topnav-featured').hide()
        topnavFeaturedIsActive = false
        console.log "topnav-main: shown, topnav-featured: hidden, topnavFeaturedIsActive: " + topnavFeaturedIsActive

    # Recalculate boundary of feature section on window resize
    $(window).resize ->
        console.log "$(window).resize ->"

        if $('.featured').length > 0
            console.log "$('.featured').length > 0"

            featuredBottom = $('.featured').offset().top + $('.featured').height() - $('.topnav').height()
            console.log "resized featuredBottom: " + featuredBottom

        if window.matchMedia('(min-width: 992px)').matches
            console.log "window.matchMedia('(min-width: 992px)').matches"

            $('.sidenav-mask').removeClass 'is-active' 
            $('.sidenav').css 'width', '0'
            console.log "Closing sidenav"

    # Change navbar styling when scroll reaches bottom of featured image
    $(window).scroll ->
        console.log "$(window).scroll ->"

        if $('.featured').length > 0
            console.log "$('.featured').length > 0"

            windowTop = Math.round($(window).scrollTop())
            console.log "windowTop: " + windowTop

            if windowTop < featuredBottom
                console.log "windowTop < featuredBottom"

                if topnavMainIsActive
                    console.log "topnavMainIsActive: " + topnavMainIsActive

                    $('.topnav-main').fadeOut(500)
                    topnavMainIsActive = false
                    $('.topnav-featured').fadeIn(500)
                    topnavFeaturedIsActive = true
                    console.log "topnav-main: fadeOut, topnav-featured: fadeIn, topnavMainIsActive: " + topnavMainIsActive + ", topnavFeaturedIsActive: " + topnavFeaturedIsActive

            else
                console.log "windowTop >= featuredBottom"

                if topnavFeaturedIsActive
                    console.log "topnavFeaturedIsActive: " + topnavFeaturedIsActive

                    $('.topnav-featured').fadeOut(500)
                    topnavFeaturedIsActive = false
                    $('.topnav-main').fadeIn(500)
                    topnavMainIsActive = true
                    console.log "topnav-main: fadeIn, topnav-featured: fadeOut, topnavMainIsActive: " + topnavMainIsActive + ", topnavFeaturedIsActive: " + topnavFeaturedIsActive

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