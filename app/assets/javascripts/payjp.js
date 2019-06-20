(function() {
  var form = $("charge-form"),
      number = form.find('input[name="number"]'),
      cvc = form.find('input[name="cvc"]'),
      exp_month = form.find('select[name="exp_month"]'),
      exp_year = form.find('input[name="exp_year"]');

  $("#charge-form").submit(function() {
    form.find("input[type=submit]").prop("disabled", true);

    var card = {
        number: number.value,
        cvc: cvc.value,
        exp_month: exp_month.value,
        exp_year: exp_year.value
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        form.find('.payment-errors').text(response.error.message);
        form.find('button').prop('disabled', false);
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");

        var token = response.id;

        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
      }
    });
  });
});



// (function() {
//     var form = $("#charge-form");
//         Payjp.setPublicKey('pk_test_a8d83b01f25e72078fc1e347');
//         card_number = form.find('input[name="card_number"]');
//         security_code = form.find('input[name="security_code"]');
//         expiration_date_month = form.find('select[name="expiration_date_month"]');
//         expiration_date_year = form.find('input[name="expiration_date_year"]');

//   $("#charge-form").on("click", function(e) {
//     e.preventDefault(); 
//     console.log("test")
//     form.find("input[type=submit]").prop("disabled", true);

//     var card = {
//         card_number: card_number.value,
//         security_code: security_code.value,
//         expiration_date_month: expiration_date_month.value,
//         expiration_date_year: expiration_date_year.value
//     };
//     Payjp.createToken(card, function(s, response) {
//       if (response.error) {
//         form.find('.payment-errors').text(response.error.message);
//         form.find('button').prop('disabled', false);
//       }
//       else {
//         $(".number").removeAttr("name");
//         $(".cvc").removeAttr("name");
//         $(".exp_month").removeAttr("name");
//         $(".exp_year").removeAttr("name");

//         var token = response.id;
//         console.log(token)

//         form.append($('<input type="hidden" name="payjpToken" />').val(token));
//         form.get(0).submit();
//       }
//     });
//   });
// });