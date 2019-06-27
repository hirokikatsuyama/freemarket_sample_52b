window.onload = function(){

  if(window.File && window.FileList && window.FileReader)
  {
      var filesInput = document.getElementById("files");

      filesInput.addEventListener("change", function(event){

          var files = event.target.files;
          var output = document.getElementById("preview");

          for(var i = 0; i< files.length; i++)
          {   var file = files[i];
              if(!file.type.match('image'))
                continue;

              var picReader = new FileReader();

              picReader.addEventListener("load",function(event){

                  var picFile = event.target;
                  var div = document.createElement("div");

                  div.innerHTML ="<div class='sell-upload-item' id='preview'><figure class='sell-upload-item__top'><img height='80' width='110' name='preview' src='" + picFile.result + "' ></figure><div class='sell-upload-item__bottom'><div class='sell-upload-item__bottom__side1'><a href='' class=''>編集</a></div><div class='sell-upload-item__bottom__side2'><a href='' class=''>削除</a></div></div></div>";

                  output.insertBefore(div,null);
              });

              picReader.readAsDataURL(file);
              var database_images = []
              database_images.push(file);
          }
      });
  }
}
