$(window).on('turbolinks:load', function() {
  $('#only-navbar').mouseenter(function() {
    $('#only-navbar').animate({
      "opacity": 1
    }, 1000)
  })
  $('#only-navbar').mouseleave(function() {
    $('#only-navbar').animate({
      "opacity": 0
    }, 200)
  })
});
