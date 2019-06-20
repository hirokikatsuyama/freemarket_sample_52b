$(function(){
  //中カテゴリのhtml
  function buildChild(){
    var html =`<%= f.collection_select :category, @children, :id, :name,{prompt: "---"}, class: "select-default", id: "parent-form", name: 'item[category_ids][]' %>`
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
    //発火されたら、
  .done(function(data) {
    //htmlは(中カテゴリのプルダウン。)
    var html = buildChild();
    //hamlのselect-wrapクラスに、 htmlが現れる。(中カテゴリのプルダウン)
    $('.select-wrap').append(html);
    })

    //失敗したら、エラーのアラート
  .fail(function(){
    alert('error');
  })
})
});