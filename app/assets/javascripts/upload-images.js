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

//1番目プレビュー
  $("#item_images_attributes_0_image").on("change", function(){
    var preimage1 = '<div class="preimage preimage1"><div class="preimage__top"><img id="img1" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
    $('#item_images_attributes_0_image').hide();
    $('#item_images_attributes_1_image').show();
    $('#preview').append(preimage1)
    })

  $("#item_images_attributes_0_image").change(function(e){
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();
    //アップロードした画像を設定する
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
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();
    //アップロードした画像を設定する
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
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();
    //アップロードした画像を設定する
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
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();
    //アップロードした画像を設定する
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
      'top':'180px',
      'width':'100%'
    });

    })

  $("#item_images_attributes_4_image").change(function(e){
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();
    //アップロードした画像を設定する
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
    $('.all-gazo').css({
      'position':'relative'
    });
    $('.single-main__section__picture__uploader').css({
      'position':'absolute',
      'top':'180px',
      'left':'123px',
      'width':'calc(100% - 140px)'
    });
    $('.preimage6').css({
      'position':'absolute',
      'top':'180px'
    });
    })

    $("#item_images_attributes_5_image").change(function(e){
      //ファイルオブジェクトを取得する
      var file = e.target.files[0];
      var reader = new FileReader();
      //アップロードした画像を設定する
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
      'position':'absolute',
      'top':'180px',
      'left':'245px',
      'width':'calc(100% - 280px)'
    });
    $('.preimage7').css({
      'position':'absolute',
      'top':'180px',
      'left':'123px'
    });
    })

  $("#item_images_attributes_6_image").change(function(e){
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();
    //アップロードした画像を設定する
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
      'position':'absolute',
      'top':'180px',
      'left':'370px',
      'width':'calc(100% - 485px)'
    });
    $('.preimage8').css({
      'position':'absolute',
      'top':'180px',
      'left':'245px'
    });
    })

    $("#item_images_attributes_7_image").change(function(e){
      //ファイルオブジェクトを取得する
      var file = e.target.files[0];
      var reader = new FileReader();
      //アップロードした画像を設定する
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
      'position':'absolute',
      'top':'180px',
      'left':'490px',
      'width':'calc(100% - 500px)'
    });
    $('.preimage9').css({
      'position':'absolute',
      'top':'180px',
      'left':'370px'
    });
    })

    $("#item_images_attributes_8_image").change(function(e){
      //ファイルオブジェクトを取得する
      var file = e.target.files[0];
      var reader = new FileReader();
      //アップロードした画像を設定する
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
      'top':'180px',
      'left':'490px'
    });
    })

  $("#item_images_attributes_9_image").change(function(e){
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();
    //アップロードした画像を設定する
    reader.onload = (function(file){
      return function(e){
        $("#img10").attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file);
  });
});


// });
// $(document).on("tubolinks:load", function(){
// $(function(){
//   var dropzone = $(".item__img__dropzone__input");
//   var dropzone2 = $(".item__img__dropzone2__input2");
//   var appendzone = $(".item__img__dropzone2");
//   var input_area = $(".input-area");
//   var preview = $("#preview");
//   var preview2 = $("#preview2");

//   var images = [];
//   // DB用の配列
//   var new_image_files = [];

//   $("#new_item .item__img__dropzone, #new_item .item__img__dropzone2").on("change", 'input[type= "file"].upload-image', function(){
//     var file = $(this).prop("files")[0];
//     new_image_files.push(file)
//     var reader = new FileReader();

//     var img = $(`<div class="add_img"><div class="img_area"><img class="image"></div></div>`);
//     var btn_wrapper = $(`<div class="btn_wrapper"><a class="btn_edit">編集</a><a class="btn_delete">削除</a></div>`);

//     img.append(btn_wrapper);

//     reader.onload = function(e){
//       img.find("img").attr({
//         src: e.target.result
//       });
//     };
//     // ファイルを読み込むメソッド
//     reader.readAsDataURL(file);
//     images.push(img);

//     if (images.length <= 4){
//       $('#preview').empty();
//       $.each(images, function(index, image){
//         image.data('image', index);
//         preview.append(image);
//       })
//       dropzone.css({
//         'width': `calc(100% - (20% * ${images.length}))`
//       })
//     } else if (images.length == 5) {
//       $("#preview").empty();
//       $.each(images, function(index, image) {
//         image.data("image", index);
//         preview.append(image);
//       });
//       appendzone.css({
//         display: "block"
//       });
//       dropzone.css({
//         display: "none"
//       });
//       preview2.empty();
//     } else if (images.length >= 6){
//       var pickup_images = images.slice(5);
//       $.each(pickup_images, function(index, image){
//         image.data("image", index + 5);
//         preview2.append(image);
//         dropzone2.css({
//           width: `calc(100% - (20% * ${images.length - 5}))`
//         });
//       });

//       if (images.length == 10){
//         dropzone2.css({
//           display: "none"
//         });
//       }
//     }
//     var new_image = $(
//       `<input multiple= "multiple" name="images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`
//     );
//     input_area.append(new_image);
//   });

//   $("#new_item .item__img__dropzone, #new_item .item__img__dropzone2").on('click', '.btn_delete', function(){
//   //削除ボタンを押した時
//   var target_image = $(this).parent().parent();
//   var target_image_num = target_image.data('image');

//   target_image.remove();

//   images.splice(target_image_num, 1);
//   new_image_files.splice(target_image_num, 1);

//   if(images.length == 0){
//     $('input[type= "file"].upload-image').attr({
//       'data-image':0
//     })
//   }
//   if (images.length <= 4){
//     $('preview').empty();
//     $.each(images, function(index, image){
//       image.data('image', index);
//       preview.append(image);
//     })
//     dropzone.css({
//       'width':`calc(100% - (20% * ${images.length}))`,
//       'display': 'block'
//     })
//     appendzone.css({
//       'display': 'none'
//     })
//   } else if (images.length == 5){
//     $('#preview').empty();
//     $.each(images, function(index, image){
//       image.data('image', index);
//       preview.append(image);
//     })
//     appendzone.css({
//       'display':`block`,
//     })
//     dropzone2.css({
//       'width':'100%'
//     })
//     dropzone.css({
//       'display':'none'
//     })
//     preview2.empty();
//   } else {
//     var pickup_images1 = images.slice(0,5);

//     // 1~5枚目を１段目に表示
//     $('#preview').empty();
//     $.each(pickup_images1, function(index, image){
//       image.data('image', index);
//       preview.append(image);
//     })

//     // 6枚目以降の画像を抽出
//     var pickup_images2 = images.slice(5);

//     // 6枚目以降を2段目に表示
//     $.each(pickup_images2, function(index, image){
//       image.data('image', index + 5);
//       preview2.append(image);
//       dropzone2.css({
//         'display':'block',
//         'width': `calc(100% - (20% * ${images.length - 5}))`
//       })
//     })
//   }
// })
//   // アップロードされたファイルの送信
// $('.new_item').on('submit', function(e){
//   // 通常のsubmitイベントを止める
//   e.preventDefault();
//   // formDataのオブジェクトを作成
//   var formData = new FormData($(this).get(0));
//   // アップロードされたファイルデータをformDataに入れる
//   // new_image_files.forEach(function(file){
//   //   console.log(file);
//   //   formData.append("new_images[images][]", file);
//   //   console.log(formData.get('name'));
//   // });

//   new_image_files.map(function(file){
//     console.log(file);
//     formData.append("new_images[images][]", file);
//     console.log(formData.getAll('new_images[images][]'));
//   });

//   $.ajax({
//     url:    '/items',
//     type:   "POST",
//     data:   formData,
//     contentType: false,
//     processData: false,
//   })
//   // location.href = '/';
//   });
// });

