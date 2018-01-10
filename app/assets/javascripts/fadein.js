$(window).on('turbolinks:load', function() {
  $('.fadein').mouseenter(function(e) {
    $(e.target).animate({
      "opacity": 1
    }, 1000)
  })
  $('.fadein').mouseleave(function(e) {
    $(e.target).closest('.fadein').animate({
      "opacity": 0
    }, 200)
  })
});
