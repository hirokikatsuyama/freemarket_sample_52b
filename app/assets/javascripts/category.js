$(function(){
  $('a[href^="#parent"]').on('click',function() {
    var speed = 200;
    var href= $(this).attr("href");
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top;
    $('body,html').animate({scrollTop:position}, speed, 'swing');
    return false;
  });

  $('ul.header__inner__bottom-left__box li').not('li.header__inner__bottom-left__box__brand').mouseenter(function(){
    $(this).children("ul").show();
  });
  $('ul.header__inner__bottom-left__box li').not('li.header__inner__bottom-left__box__brand').mouseleave(function(){
    $(this).children("ul").hide();
  });
});
