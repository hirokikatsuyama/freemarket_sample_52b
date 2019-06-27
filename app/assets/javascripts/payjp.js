$(function(){

var form = $("#charge-form");
  Payjp.setPublicKey("pk_test_a8d83b01f25e72078fc1e347");
  $("#charge-form").on("submit",function(e){
    e.preventDefault();
    var card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val(),
    };
    Payjp.createToken(card,function(status,response){
      form.find("input[type=submit]").prop("disabled", true);
      if(status == 200){
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        alert("クレジットカードの登録が完了しました");

        var token = response.id;
        $("#charge-form").append(`<input type="hidden" name="pay_id" class="payjp-token" value=${token} />`)
        $("#charge-form").get(0).submit();
      }else{
        alert("カード情報が正しくありません");
      }
    });
  });
});