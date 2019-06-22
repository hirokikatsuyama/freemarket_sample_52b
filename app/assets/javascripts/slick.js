$(function(){
  var slider = "#slider";
  var thumbnailItem = ".itembox__container__small__photobox__img__photo";

  $(thumbnailItem).each(function(){
    var index = $(thumbnailItem).index(this);
    $(this).attr("data-index",index);
  });

  $(slider).on('init',function(slick){
    var index = $(".slide-item.slick-slide.slick-current").attr("data-slick-index");
    $(thumbnailItem+'[data-index="'+index+'"]').addClass("thumbnail-current");
  });

  $(slider).slick({
    arrows: false,
    fade: true,
    infinite: false
  });

  $(thumbnailItem+'[data-index="'+ 0 +'"]').addClass("thumbnail-current");
  $(thumbnailItem).on('click',function(){
    var index = $(this).attr("data-index");
    $(slider).slick("slickGoTo",index,false);
  });

  $(slider).on('beforeChange',function(event, slick, currentSlide, nextSlide){
    $(thumbnailItem).each(function(){
      $(this).removeClass("thumbnail-current");
    });
    $(thumbnailItem+'[data-index="'+nextSlide+'"]').addClass("thumbnail-current");
  });
});