$(function() {
  var input = $('#item_price');
  var output = $('.single-main__section__price__sell-form__profit__pricebox');
  var output2 = $('.single-main__section__price__sell-form__margin__feebox')
  input.on('input', function(e) {
    var value = input.val();
    var fee = Math.round(value * 0.10)
    var tax = Math.round(value * 0.9)
    var non = "-"
    if (fee, tax <= 99) {
      output.text(non);
      output2.text(non); 
  } else if (100 <= fee, tax <= 9999999) {
      output.text("¥"+tax.toLocaleString());
      output2.text("¥"+fee.toLocaleString()); //コンマ区切りの記述
  } else {
      output.text(non);
      output2.text(non); 
  }
  });
});