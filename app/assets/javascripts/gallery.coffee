$(document).on 'turbolinks:load', ->
  # Initialize magnific popup
  $('.gallery-image-popup').magnificPopup
    type: 'image',
    closeOnContentClick: true,
    closeBtnInside: false,
    fixedContentPos: true,
    mainClass: 'mfp-no-margins mfp-with-zoom',
    image:
      verticalFit: true
    zoom:
      enabled: true,
      duration: 300
  $('.image-link').magnificPopup
    type: 'image'
  # init Isotope
  $gallery = $('.gallery').isotope
    itemSelector: '.gallery-item'
    layoutMode: 'packery',
      packery:
        columnWidth: '.gallery-sizer'
  #layout Isotope after each image loads
  $gallery.imagesLoaded().progress ->
    $gallery.isotope 'layout'
  # filter functions
  filterFns =
    numberGreaterThan50: ->
      number = $(this).find('.number').text()
      parseInt(number, 10) > 50
    ium: ->
      name = $(this).find('.name').text()
      name.match /ium$/
  # bind filter button click
  $('.filters-button-group').on 'click', 'button', ->
    filterValue = $(this).attr('data-filter')
    # use filterFn if matches value
    filterValue = filterFns[filterValue] or filterValue
    $gallery.isotope filter: filterValue
    return
  # change is-checked class on buttons
  $('.button-group').each (i, buttonGroup) ->
    $buttonGroup = $(buttonGroup)
    $buttonGroup.on 'click', 'button', ->
      $buttonGroup.find('.is-checked').removeClass 'is-checked'
      $(this).addClass 'is-checked'