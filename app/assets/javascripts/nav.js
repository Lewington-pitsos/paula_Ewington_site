$(window).on('turbolinks:load', function() {
  var $navbar = $('#only-navbar');
  var $holder = $('#nav-holder');

  setTimeout(function() {
    $holder.mouseenter(function(e) {
      $navbar.removeClass('hidden')
      $navbar.removeClass('fadeOutUp');
      $navbar.addClass('fadeInDown');
    })
    $('#only-navbar').click(function(e) {
      $navbar.removeClass('fadeInDown');
      $navbar.addClass('fadeOutUp');
    })
  }, 1000);
  
});
