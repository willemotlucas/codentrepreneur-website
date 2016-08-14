document.addEventListener("turbolinks:load", function() {
	$(function(){
		Stripe.setPublishableKey('pk_test_gAYcDnLR6ZYr0pE9MI9pc1PP');

		var errorMessages = {
		  incorrect_number: "Le numéro de la carte est incorrect.",
		  invalid_number: "Le numéro de la carte est invalide.",
		  invalid_expiry_month: "Le mois d'expiration de la carte est invalide.",
		  invalid_expiry_year: "L'année d'expiration de la carte est invalide.",
		  invalid_cvc: "Le code de sécurité de la carte est invalide.",
		  expired_card: "La carte a expiré.",
		  incorrect_cvc: "Le code de sécurité de la carte est incorrect.",
		  incorrect_zip: "Le code postal de la carte est incorrect.",
		  card_declined: "La carte a été refusée.",
		  missing: "There is no card on a customer that is being charged.",
		  processing_error: "Une erreur innatendue est survenue pendant le paiement.",
		  rate_limit:  "Une erreur est survenue suite à un trop grand nombre de requêtes.",
		  invalid_request_error: "Aucune information sur la carte n'a été trouvée."
		};

		  $(function() {
		    var $form = $('#payment-form');
		    console.log($form);
		    $form.submit(function(event) {
		      // Disable the submit button to prevent repeated clicks:
		      $form.find('.payment-btn').prop('disabled', true);
		      $(".has-danger").removeClass("has-danger");

		      // Request a token from Stripe:
		      Stripe.card.createToken({
		        number: $('.card-number').val(),
		        cvc: $('.card-cvc').val(),
		        exp_month: $('.card-expiry-month').val(),
		        exp_year: $('.card-expiry-year').val()
		        }, stripeResponseHandler);

		      // Prevent the form from being submitted:
		      return false;
		    });
		  });

		  function stripeResponseHandler(status, response) {
		    // Grab the form:
		    var $form = $('#payment-form');

		    if(parseFloat($('#project-price').html()) == 0) {
		    	$form.get(0).submit();
		    } else if (response.error) { // Problem!

				if (response.error.type == 'card_error'){
				    $( '.payment-errors' ).text( errorMessages[ response.error.code ] );
				} else if(response.error.type == "invalid_request_error"){
					$( '.payment-errors' ).text( errorMessages[ response.error.type ] );
				}

		    	if(response.error.type == "invalid_request_error"){
		    		$(".row-card-number").addClass("has-danger");
		    		$(".row-expiry-date").addClass("has-danger");
		    		$(".form-group-cvc").addClass("has-danger");
		    	} else if(response.error.param == "exp_year" || response.error.param == "exp_month"){
		    		$(".form-group-date").addClass("has-danger");	
		    	} else if(response.error.param == "cvc"){
		    		$(".form-group-cvc").addClass("has-danger");	
		    	} else if(response.error.param == "number"){
		    		$(".row-card-number").addClass("has-danger");	
		    	}

		      console.log(response);

		      $form.find('.payment-btn').prop('disabled', false); // Re-enable submission

		    } else { // Token was created!
		      // Get the token ID:
		      var token = response.id;

		      // Insert the token ID into the form so it gets submitted to the server:
		      $form.append($('<input type="hidden" name="stripeToken">').val(token));

		      // Submit the form:
		      $form.get(0).submit();
		    }
		  };
	});
})	