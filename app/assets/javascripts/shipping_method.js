$(function(){
  function buildShipping(){
    var html = `<div class=".single-main__section__delivery__pulldown__one" id="shipping">
                  <label class="normal-label">配送料の方法</label>
                  <span class="form-require">必須</span>
                  <div class="single-main__section__delivery__pulldown__one__tab">
                    <select id="pulu2" required:"required" name="item[shipping_method_id]">"---"</select>
                  </div>
                </div>`
    return html;}

  function buildShippingOption(shipping){
    var html = `<option value="${shipping.id}">${shipping.method_name}</option>`
    return html;}

    $('#item_shipping_cost').on("change",function(){
      $('#shipping').remove();
      //サイズが1度選択されたらselectタブをremove
      // $('#pulu2').remove();
      var shippingValue = document.getElementById("item_shipping_cost").value;
        $.ajax({
          //itemコントローラの中のsearchアクションへ
          url:  '/items/shipping_search',
          type: "GET",
          //サイズの値をshipping_idという変数にする。この値をcontrollerで@sizeを定義することに使う。
          data: { shipping_id: shippingValue },
          dataType: 'json'
        })
        .done(function(shipping) {
          $('#shipping').css('display', 'block');
            var html = buildShipping();
          $('.single-main__section__delivery__pulldown__one__tab__box').append(html);
          shipping.forEach(function(shippingOption){
            var option = buildShippingOption(shippingOption);
          $('#pulu2').append(option);  
          });
        });
    });
});