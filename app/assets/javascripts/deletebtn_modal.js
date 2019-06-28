$(function() {
  $('#open').on('click', function(){
    posi = $(window).scrollTop();
  $('body').css({
    position: 'fixed',
    top: -1 * posi
  });
  $('#overlay, #modalwindow').fadeIn();
  });

  $('#close').on('click', function(){
    $('body').attr('style', '');
    $('html, body').prop({scrollTop: posi});
    $('#overlay, #modalwindow').fadeOut();
  });
});