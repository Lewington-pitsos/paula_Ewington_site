$(window).on('turbolinks:load', function() {
  $('.work-title').mouseenter(function() {
    $('.work-title').animate({
      "opacity": 1
    }, 1000)
  })
  $('.work-title').mouseleave(function() {
    $('.work-title').animate({
      "opacity": 0
    }, 200)
  })
});
