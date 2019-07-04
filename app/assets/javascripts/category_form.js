$(function(){
    //中カテゴリのselectタブのhtml
    function buildChild(){
      var html =`<select class="item-contents__item-about_box_condition_input" id="child" name="item[category_id]"></select>`
      return html;}

    //小カテゴリのselectタブのhtml
    function buildGrandChild(){
      var html =`<select class="item-contents__item-about_box_condition_input" id="grand_child" name="item[category_id]"></select>`
      return html;}

  　//小、中カテゴリのoptionタブのhtml これをselectタブに代入
    function buildOption(cateChild){
      var html = `<option value="${cateChild.id}">${cateChild.name}</option>`
      return html;}

    //サイズのselectタブのhtml
    function buildSize(){
      var html = `<div class="single-main__section__item--detail__pulldown__one" id="sizebox">
                  <div class="single-main__section__item--detail__pulldown__one.hide__form"></select>
                    <label class="normal-label">サイズ</label>
                    <span class="form-require">必須</span>
                    <div class="single-main__section__item--detail__pulldown__one__tab"></div>
                      <select class="select--booox" required:"required" id="size" name="item[size_id]" "---"></select>`
      return html;}

    function buildSizeOption(sizingOption){
      var html = `<option value="${sizingOption.id}">${sizingOption.name}</option>`
      return html;}

    //#parent-formのid = 大カテゴリプルダウンが選択されたら発火
    $('#parent-form').on("change",function(){

        //中カテゴリが1度選択されたらリセット
        $('#child').remove();
        //小カテゴリが1度選択されたらリセット
        $('#grand_child').remove();

        $('#sizebox').remove();
        //parentValueに、大カテゴリのhtmlの値を代入。
        var parentValue = document.getElementById("parent-form").value;

        $.ajax({
          //itemsファイルの中のsearch.json.jbuilderを読み込む
          url: '/items/search',
          type: "GET",
          // 大カテゴリの値をparent_idという変数にする。この値をcontrollerで@childrenを定義することに使う。
          data: {parent_id: parentValue },
          dataType: 'json'
        })

        //発火されたら、「中カテゴリのoptionタブhtml」を引数として受け取る
        .done(function(data) { //dataでそれぞれのテーブルの値を配列で両方とも取得
          //htmlは(中カテゴリのselectタブ。)
          var html = buildChild();
          //hamlのselect-wrapクラスに、(中カテゴリのselectタブ)が現れる。
          $('.select-wrap').append(html)
          //optionタブにそれぞれ、中カテゴリの値を入れる。dataからカテゴリーテーブルの値を取得
          data.categories.forEach(function(cateChild){
          //option = (中カテゴリの値)
          var option = buildOption(cateChild);
          //selectタブの中に、optionタブを表示。
          $('#child').append(option);
          })

            //#childのid = 中カテゴリプルダウンが選択されたら発火
            $("#child").on("change", function(){
              $('#sizebox').remove();
              var parentValue = document.getElementById("child").value;
                $.ajax({
                  //itemsファイルの中のsearch.json.jbuilderを読み込む
                  url:  '/items/search',
                  type: "GET",
                  // 大カテゴリの値をparent_idという変数にする。この値をcontrollerで@childrenを定義することに使う。
                  data: {parent_id: parentValue },
                  dataType: 'json'
                })
                .done(function(data) {
                  //htmlは(小カテゴリのselectタブ。)
                  var html = buildGrandChild();
                  //hamlのselect-wrapクラスに、(小カテゴリのselectタブ)が現れる。
                  $('.select-wrap').append(html)
                  //optionタブにそれぞれ、小カテゴリの値を入れる。
                  data.categories.forEach(function(cateChild){
                  //option = (小カテゴリの値)
                  var option = buildOption(cateChild);
                  //selectタブの中に、optionタブを表示。
                  $('#grand_child').append(option);
                  }) 

                    //#grand_childが選択されたら発火
                    $('#grand_child').on("change",function(){
                      $('#sizebox').remove();
                      //サイズが1度選択されたらselectタブをremove
                      // $('#size').remove();
                      var parentValue = document.getElementById("grand_child").value;
                        $.ajax({
                          //itemコントローラの中のsearchアクションへ
                          url:  '/items/search',
                          type: "GET",
                          //サイズの値をparent_idという変数にする。この値をcontrollerで@sizeを定義することに使う。
                          data: { parent_id: parentValue },
                          dataType: 'json'
                        })
                        .done(function(data) {
                          if(data.size == ""){$('.single-main__section__item--detail__pulldown__one').css('display', 'none')}
                          else{
                            $('.single-main__section__item--detail__pulldown__one').css('display', 'block')
                              var html = buildSize();
                            $('.select-wrap').append(html)
                            data.sizes.forEach(function(sizingOption){
                            var option = buildSizeOption(sizingOption);
                            $('#size').append(option);  
                            });
                          }
                        });
                    });
               }) 
            }) 
        })
    })
});