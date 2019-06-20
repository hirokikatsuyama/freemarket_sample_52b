$(function(){
  //中カテゴリのselectタブのhtml
  function buildChild(){
    var html =`<select class="item-contents__item-about_box_condition_input" id="child" name="item[item_categories_attributes][0][category_id]"></select>`
    return html;}
　//中カテゴリのoptionタブのhtml
    function buildOption(cateChild){
      var html = `<option value="${cateChild.id}">${cateChild.name}</option>`
      return html;}

  // #parent-formのid = 大カテゴリプルダウンが選択されたら発火
  $('#parent-form').on("change",function(){
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
    console.log(cateChild);
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
    })

    //失敗したら、エラーのアラート
  .fail(function(){
    alert('error');
  })
})
});