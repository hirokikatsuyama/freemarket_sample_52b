// window.onload = function(){

//   if(window.File && window.FileList && window.FileReader)
//   {
//       var filesInput = document.getElementById("files");

//       filesInput.addEventListener("change", function(event){

//           var files = event.target.files;
//           var output = document.getElementById("preview");

//           for(var i = 0; i< files.length; i++)
//           {   var file = files[i];
//               if(!file.type.match('image'))
//                 continue;

//               var picReader = new FileReader();

//               picReader.addEventListener("load",function(event){

//                   var picFile = event.target;
//                   var div = document.createElement("div");

//                   div.innerHTML ="<div class='sell-upload-item' id='preview'><figure class='sell-upload-item__top'><img height='80' width='110' name='preview' src='" + picFile.result + "' ></figure><div class='sell-upload-item__bottom'><div class='sell-upload-item__bottom__side1'><a href='' class=''>編集</a></div><div class='sell-upload-item__bottom__side2'><a href='' class=''>削除</a></div></div></div>";

//                   output.insertBefore(div,null);
//               });

//               picReader.readAsDataURL(file);
//               var database_images = []
//               database_images.push(file);
//           }
//       });
//   }
// }
// $(document).on("tubolinks:load", function(){
$(function(){
  var dropzone = $(".item__img__dropzone__input");
  var dropzone2 = $(".item__img__dropzone2__input2");
  var appendzone = $(".item__img__dropzone2");
  var input_area = $(".input-area");
  var preview = $("#preview");
  var preview2 = $("#preview2");

  var images = [];
  // DB用の配列
  var new_image_files = [];

  $("#new_item .item__img__dropzone, #new_item .item__img__dropzone2").on("change", 'input[type= "file"].upload-image', function(){
    var file = $(this).prop("files")[0];
    new_image_files.push(file)
    var reader = new FileReader();

    var img = $(`<div class="add_img"><div class="img_area"><img class="image"></div></div>`);
    var btn_wrapper = $(`<div class="btn_wrapper"><a class="btn_edit">編集</a><a class="btn_delete">削除</a></div>`);

    img.append(btn_wrapper);

    reader.onload = function(e){
      img.find("img").attr({
        src: e.target.result
      });
    };
    // ファイルを読み込むメソッド
    reader.readAsDataURL(file);
    images.push(img);

    if (images.length <= 4){
      $('#preview').empty();
      $.each(images, function(index, image){
        image.data('image', index);
        preview.append(image);
      })
      dropzone.css({
        'width': `calc(100% - (20% * ${images.length}))`
      })
    } else if (images.length == 5) {
      $("#preview").empty();
      $.each(images, function(index, image) {
        image.data("image", index);
        preview.append(image);
      });
      appendzone.css({
        display: "block"
      });
      dropzone.css({
        display: "none"
      });
      preview2.empty();
    } else if (images.length >= 6){
      var pickup_images = images.slice(5);
      $.each(pickup_images, function(index, image){
        image.data("image", index + 5);
        preview2.append(image);
        dropzone2.css({
          width: `calc(100% - (20% * ${images.length - 5}))`
        });
      });

      if (images.length == 10){
        dropzone2.css({
          display: "none"
        });
      }
    }
    var new_image = $(
      `<input multiple= "multiple" name="images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`
    );
    input_area.append(new_image);
  });

  $("#new_item .item__img__dropzone, #new_item .item__img__dropzone2").on('click', '.btn_delete', function(){
  //削除ボタンを押した時
  var target_image = $(this).parent().parent();
  var target_image_num = target_image.data('image');

  target_image.remove();

  images.splice(target_image_num, 1);
  new_image_files.splice(target_image_num, 1);

  if(images.length == 0){
    $('input[type= "file"].upload-image').attr({
      'data-image':0
    })
  }
  if (images.length <= 4){
    $('preview').empty();
    $.each(images, function(index, image){
      image.data('image', index);
      preview.append(image);
    })
    dropzone.css({
      'width':`calc(100% - (20% * ${images.length}))`,
      'display': 'block'
    })
    appendzone.css({
      'display': 'none'
    })
  } else if (images.length == 5){
    $('#preview').empty();
    $.each(images, function(index, image){
      image.data('image', index);
      preview.append(image);
    })
    appendzone.css({
      'display':`block`,
    })
    dropzone2.css({
      'width':'100%'
    })
    dropzone.css({
      'display':'none'
    })
    preview2.empty();
  } else {
    var pickup_images1 = images.slice(0,5);
    
    // 1~5枚目を１段目に表示
    $('#preview').empty();
    $.each(pickup_images1, function(index, image){
      image.data('image', index);
      preview.append(image);
    })

    // 6枚目以降の画像を抽出
    var pickup_images2 = images.slice(5);

    // 6枚目以降を2段目に表示
    $.each(pickup_images2, function(index, image){
      image.data('image', index + 5);
      preview2.append(image);
      dropzone2.css({
        'display':'block',
        'width': `calc(100% - (20% * ${images.length - 5}))`
      })
    })
  }
})
  // アップロードされたファイルの送信
$('.new_item').on('submit', function(e){
  // 通常のsubmitイベントを止める
  e.preventDefault();
  // formDataのオブジェクトを作成
  var formData = new FormData($(this).get(0));
  // アップロードされたファイルデータをformDataに入れる
  // new_image_files.forEach(function(file){
  //   console.log(file);
  //   formData.append("new_images[images][]", file);
  //   console.log(formData.get('name'));
  // });

  new_image_files.map(function(file){
    console.log(file);
    formData.append("new_images[images][]", file);
    console.log(formData.getAll('new_images[images][]'));
  });

  $.ajax({
    url:    '/items',
    type:   "POST",
    data:   formData,
    contentType: false,
    processData: false,
  });
  location.href = '/';
  });
});