$(function(){
  //中カテゴリのselectタブのhtml
  function buildChild(){
    var html =`<select class="item-contents__item-about_box_condition_input" id="child" name="item[item_categories_attributes][0][category_id]"></select>`
    return html;}

    //小カテゴリのselectタブのhtml
  function buildGrandChild(){
    var html =`<select class="item-contents__item-about_box_condition_input" id="grand_child" name="item[item_categories_attributes][0][category_id]"></select>`
    return html;}

　//中カテゴリのoptionタブのhtml
    function buildOption(cateChild){
      var html = `<option value="${cateChild.id}">${cateChild.name}</option>`
      return html;}

  //配送箇所のselectタグとoptionタグのhtml
    function buildShippingMethod(){
      var html = '<select><option value>--</option><option value="1">クロネコヤマト</option><option value="2">ゆうパック</option><option value="3">ゆうメール</option></select>'
      return html;}

  // #parent-formのid = 大カテゴリプルダウンが選択されたら発火
  $('#parent-form').on("change",function(){

  //中カテゴリが1度選択されたらリセット
  $('#child').remove();
  //小カテゴリが1度選択されたらリセット
  $('#grand_child').remove();
   // parentValueに、大カテゴリのhtmlの値を代入。
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
  .done(function(cateChild) {
    //htmlは(中カテゴリのselectタブ。)
    var html = buildChild();
    //hamlのselect-wrapクラスに、(中カテゴリのselectタブ)が現れる。
    $('.select-wrap').append(html)
    //optionタブにそれぞれ、中カテゴリの値を入れる。
    cateChild.forEach(function(cateChild){
     //option = (中カテゴリの値)
      var option = buildOption(cateChild);
    //selectタブの中に、optionタブを表示。
      $('#child').append(option);
    })

  $("#child").on("change", function(){
    var parentValue = document.getElementById("child").value;
  $.ajax({
    //itemsファイルの中のsearch.json.jbuilderを読み込む
    url:  '/items/search',
    type: "GET",
    // 大カテゴリの値をparent_idという変数にする。この値をcontrollerで@childrenを定義することに使う。
    data: {parent_id: parentValue },
    dataType: 'json'
  })
  .done(function(cateChild) {
    //htmlは(中カテゴリのselectタブ。)
    var html = buildGrandChild();
    //hamlのselect-wrapクラスに、(中カテゴリのselectタブ)が現れる。
    $('.select-wrap').append(html)
    //optionタブにそれぞれ、中カテゴリの値を入れる。
    cateChild.forEach(function(cateChild){
     //option = (中カテゴリの値)
      var option = buildOption(cateChild);
    //selectタブの中に、optionタブを表示。
      $('#grand_child').append(option);
    })
    })
  })
  })
  })
});

