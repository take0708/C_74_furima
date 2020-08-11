document.addEventListener (
  "DOMContentLoaded", e => {
    if (document.getElementById("submitToken") != null) {
      Payjp.setPublicKey("pk_test_9c80a5edeb7c36a3c71632a1");
      let btn = document.getElementById("submitToken");
      btn.addEventListener("click", e => {
        e.preventDefault();
        let card = {
          nmber: document.getElementById("cardNumber").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("expMonth").value,
          exp_year: document.getElementById("expYear").value
        };
        Payjp.createToken(cars, (status, response) => {
          if (status == 200) {
            $("#cardNumber").removeAtter("name");
            $("#cvc").removeAtter("name");
            $("#expMonth").removeAtter("name");
            $("#expYear").removeAtter("name")
            $("#card_token").append (
              $('<input type = "hidden" name = "payjp-token>"').val(response.id)
            );
            document.inputForm.submit();
            alert("カードの登録が完了しました");
          } else {
            alert("カード情報が正しくありません");
          }
        });
      });
    }
  },
  false
)