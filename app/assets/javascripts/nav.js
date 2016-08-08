// Generated by CoffeeScript 1.10.0
$(document).on('turbolinks:load', function() {
  $('.open-sidenav').click(function() {
    $('.sidenav-mask').addClass('is-active');
    return $('.sidenav').css('width', '250px');
  });
  $('.close-sidenav').click(function() {
    $('.sidenav-mask').removeClass('is-active');
    return $('.sidenav').css('width', '0');
  });
  return $(window).resize(function() {
    if (window.matchMedia('(min-width: 992px)').matches) {
      $('.sidenav-mask').removeClass('is-active');
      return $('.sidenav').css('width', '0');
    }
  });
});

$(document).on('turbolinks:before-cache', function() {
  $('.sidenav-mask').removeClass('is-active');
  return $('.sidenav').css('width', '0');
});