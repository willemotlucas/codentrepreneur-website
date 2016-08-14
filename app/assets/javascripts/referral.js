document.addEventListener("turbolinks:load", function() {
  $(function(){
	var original_price = parseFloat($('#project-price').html());

	$('#apply-referral-code').on('click', function(){
		if(!$(this).hasClass('disabled')){
			var code_input = $('input[name="referral_code"]');
			$('.form-inline-referral').removeClass('has-success').removeClass('has-danger');
			$('.referral-code-message').html('');
			$(".project-price").each(function(){
				$(this).html(original_price);
			})

			if(code_input.val()){
				$.ajax({
				  	url: window.location.origin + "/referral_code/verify.json",
				  	data: {
				  		referral_code: code_input.val()
				  	},
				  	method: "POST"
				}).done(function(response) {
					console.log(response);
				  	if(response.code == "referral_code_available"){
				  		$('.form-inline-referral').addClass('has-success');
				  		$(".project-price").html(parseFloat(original_price - 5));
				  		$('#apply-referral-code').addClass('disabled');
				  		$('input[name="referral_code"]').prop('readonly', true);
				  	} else {
				  		$('.form-inline-referral').addClass('has-danger');
				  	}
				  	$('.referral-code-message').html(response.message);
				});
			}
		}
	});

	$('#use-referral-wallet').on('click', function(){
		if(!$('#use-referral-wallet').hasClass('disabled')){
			var new_amount = round(parseFloat(original_price - $('#wallet-amount').html()), 2);
			if(new_amount <= 0){
				new_amount = 0;
				$('.row-card-number').remove();
				$('.row-expiry-date').remove();
				$('.payment-btn').html("Obtenir le cours gratuitement !");
			}
			$(".project-price").html(new_amount);

			var new_wallet_amount = round(parseFloat($('#wallet-amount').html()) - original_price, 2);
			if(new_wallet_amount < 0){
				new_wallet_amount = 0;
			}
			$('#wallet-amount').html(new_wallet_amount);
			$('#use-referral-wallet').addClass('disabled');

			$('input[name="use_referral_wallet"]').val('true');
		}
	})

	function round(value, exp) {
	  if (typeof exp === 'undefined' || +exp === 0)
	    return Math.round(value);

	  value = +value;
	  exp = +exp;

	  if (isNaN(value) || !(typeof exp === 'number' && exp % 1 === 0))
	    return NaN;

	  // Shift
	  value = value.toString().split('e');
	  value = Math.round(+(value[0] + 'e' + (value[1] ? (+value[1] + exp) : exp)));

	  // Shift back
	  value = value.toString().split('e');
	  return +(value[0] + 'e' + (value[1] ? (+value[1] - exp) : -exp));
	}

  })
})

