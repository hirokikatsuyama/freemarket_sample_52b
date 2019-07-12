
$(function() {
  $('#item_images_attributes_1_image').hide();
  $('#item_images_attributes_2_image').hide();
  $('#item_images_attributes_3_image').hide();
  $('#item_images_attributes_4_image').hide();
  $('#item_images_attributes_5_image').hide();
  $('#item_images_attributes_6_image').hide();
  $('#item_images_attributes_7_image').hide();
  $('#item_images_attributes_8_image').hide();
  $('#item_images_attributes_9_image').hide();
  // $('#item_images_attributes_0_image').css({
  //   'display':'none'
  // });

//1番目プレビュー
$("#item_images_attributes_0_image").on("change", function(){
  var preimage1 = '<div class="preimage preimage1"><div class="preimage__top"><img id="img1" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
  $('#item_images_attributes_0_image').hide();
  $('#item_images_attributes_1_image').show();
  $('#preview').append(preimage1)
})

$("#item_images_attributes_0_image").change(function(e){
  var file = e.target.files[0];
  var reader = new FileReader();
  reader.onload = (function(file){
    return function(e){
        $("#img1").attr("src", e.target.result);
    };
  })(file);
  reader.readAsDataURL(file);
});

//2番目プレビュー
$("#item_images_attributes_1_image").on("change", function(){
  var preimage2 = '<div class="preimage"><div class="preimage__top"><img id="img2" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
  $('#item_images_attributes_1_image').hide();
  $('#item_images_attributes_2_image').show();
  $('#preview').append(preimage2)
})

$("#item_images_attributes_1_image").change(function(e){
  var file = e.target.files[0];
  var reader = new FileReader();
  reader.onload = (function(file){
    return function(e){
      $("#img2").attr("src", e.target.result);
    };
  })(file);
  reader.readAsDataURL(file);
});

//3番目プレビュー
$("#item_images_attributes_2_image").on("change", function(){
  var preimage3 = '<div class="preimage"><div class="preimage__top"><img id="img3" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
  $('#item_images_attributes_2_image').hide();
  $('#item_images_attributes_3_image').show();
  $('#preview').append(preimage3)
})

$("#item_images_attributes_2_image").change(function(e){
  var file = e.target.files[0];
  var reader = new FileReader();
  reader.onload = (function(file){
    return function(e){
      $("#img3").attr("src", e.target.result);
    };
  })(file);
  reader.readAsDataURL(file);
});

//4番目プレビュー
$("#item_images_attributes_3_image").on("change", function(){
  var preimage4 = '<div class="preimage"><div class="preimage__top"><img id="img4" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
  $('#item_images_attributes_3_image').hide();
  $('#item_images_attributes_4_image').show();
  $('#preview').append(preimage4)
  $('.single-main__section__picture__uploader').css({
    'width':'119px'
  });
})

$("#item_images_attributes_3_image").change(function(e){
  var file = e.target.files[0];
  var reader = new FileReader();
  reader.onload = (function(file){
    return function(e){
      $("#img4").attr("src", e.target.result);
    };
  })(file);
  reader.readAsDataURL(file);
});

//5番目プレビュー
$("#item_images_attributes_4_image").on("change", function(){
  var preimage5 = '<div class="preimage"><div class="preimage__top"><img id="img5" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
  $('#item_images_attributes_4_image').hide();
  $('#item_images_attributes_5_image').show();
  $('#preview').append(preimage5)
  $('.all-gazo').css({
    'width':'100%',
    'height':'360px',
    'position':'relative'
  });
  $('.single-main__section__picture__uploader').css({
    'position':'absolute',
    'top':'190px',
    'width':'calc(100% - 15px)'
  });
})

$("#item_images_attributes_4_image").change(function(e){
  var file = e.target.files[0];
  var reader = new FileReader();
  reader.onload = (function(file){
    return function(e){
      $("#img5").attr("src", e.target.result);
    };
  })(file);
  reader.readAsDataURL(file);
});

//6番目プレビュー
$("#item_images_attributes_5_image").on("change", function(){
  var preimage6 = '<div class="preimage preimage6"><div class="preimage__top"><img id="img6" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
  $('#item_images_attributes_5_image').hide();
  $('#item_images_attributes_6_image').show();
  $('#preview').append(preimage6)
  $('.single-main__section__picture__uploader').css({
    'left':'123px',
    'width':'calc(100% - 139px)'
  });
  $('.preimage6').css({
    'position':'absolute',
    'top':'190px'
  });
})

$("#item_images_attributes_5_image").change(function(e){
  var file = e.target.files[0];
  var reader = new FileReader();
  reader.onload = (function(file){
    return function(e){
      $("#img6").attr("src", e.target.result);
    };
  })(file);
  reader.readAsDataURL(file);
});

//7番目プレビュー
$("#item_images_attributes_6_image").on("change", function(){
  var preimage7 = '<div class="preimage preimage7"><div class="preimage__top"><img id="img7" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
  $('#item_images_attributes_6_image').hide();
  $('#item_images_attributes_7_image').show();
  $('#preview').append(preimage7)
  $('.single-main__section__picture__uploader').css({
    'left':'247px',
    'width':'calc(100% - 260px)'
  });
  $('.preimage7').css({
    'position':'absolute',
    'top':'190px',
    'left':'123px'
  });
})

$("#item_images_attributes_6_image").change(function(e){
  var file = e.target.files[0];
  var reader = new FileReader();
  reader.onload = (function(file){
    return function(e){
      $("#img7").attr("src", e.target.result);
    };
  })(file);
  reader.readAsDataURL(file);
});

//8番目プレビュー
$("#item_images_attributes_7_image").on("change", function(){
  var preimage8 = '<div class="preimage preimage8"><div class="preimage__top"><img id="img8" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
  $('#item_images_attributes_7_image').hide();
  $('#item_images_attributes_8_image').show();
  $('#preview').append(preimage8)
  $('.single-main__section__picture__uploader').css({
    'left':'370px',
    'width':'calc(100% - 385px)'
  });
$('.preimage8').css({
  'position':'absolute',
  'top':'190px',
  'left':'246px'
  });
})

$("#item_images_attributes_7_image").change(function(e){
  var file = e.target.files[0];
  var reader = new FileReader();
  reader.onload = (function(file){
    return function(e){
      $("#img8").attr("src", e.target.result);
    };
  })(file);
  reader.readAsDataURL(file);
});

//9番目プレビュー
$("#item_images_attributes_8_image").on("change", function(){
  var preimage9 = '<div class="preimage preimage9"><div class="preimage__top"><img id="img9" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
  $('#item_images_attributes_8_image').hide();
  $('#item_images_attributes_9_image').show();
  $('#preview').append(preimage9)
  $('.single-main__section__picture__uploader').css({
    'left':'493px',
    'width':'calc(100% - 508px)'
  });
  $('.preimage9').css({
    'position':'absolute',
    'top':'190px',
    'left':'370px'
  });
})

$("#item_images_attributes_8_image").change(function(e){
  var file = e.target.files[0];
  var reader = new FileReader();
  reader.onload = (function(file){
    return function(e){
      $("#img9").attr("src", e.target.result);
    };
  })(file);
  reader.readAsDataURL(file);
});

//10番目プレビュー
$("#item_images_attributes_9_image").on("change", function(){
  var preimage10 = '<div class="preimage preimage10"><div class="preimage__top"><img id="img10" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
  $('#item_images_attributes_9_image').hide();
  $('#preview').append(preimage10)
  $('.single-main__section__picture__uploader').hide();
  $('.preimage10').css({
    'position':'absolute',
    'top':'190px',
    'left':'492px'
  });
})

$("#item_images_attributes_9_image").change(function(e){
  var file = e.target.files[0];
  var reader = new FileReader();
  reader.onload = (function(file){
    return function(e){
      $("#img10").attr("src", e.target.result);
    };
  })(file);
  reader.readAsDataURL(file);
  });
});

