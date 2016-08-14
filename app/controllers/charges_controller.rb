class ChargesController < ApplicationController
	before_action :authenticate_user!

	def new
	end

	def preorder_project
	  	project = PreorderProject.find(params[:preorder_project_id])

	  	if Payment.where(paymentable: project, user: current_user).exists?
	  		flash[:error] = "La formation a déjà été pré-commandée"
	  		redirect_to preorder_project_path(project)
	  	else
	  	  	# Amount in cents
		  	amount = project.preorder_price * 100

			# TO DO : Add verification of referral code
			# If correct, amount = amount - 500

			# Charge the user
		  	charge = Stripe::Charge.create(
			    :amount => amount.to_i, # amount in cents, again
			    :currency => "eur",
				:source => params[:stripeToken],
			  	:description => "Précommande #{project.title} par #{current_user.email}",
			  	:receipt_email => current_user.email
			)

		  	# Save the payment in database
			if charge.paid
				payment = Payment.create(paymentable: project, user: current_user, amount: amount/100, stripe_charge_id: charge.id)
				flash[:success] = "Paiement réussi ! Vous allez recevoir un email dans quelques instants."
			else
				flash[:error] = "Une erreur est survenue pendant le paiement. Votre carte n'a pas été débitée."
			end

			redirect_to preorder_project_path(project)
	  	end
	rescue Stripe::CardError, Stripe::InvalidRequestError => e
		flash[:error] = "Une erreur est survenue pendant le paiement. Votre carte n'a pas été débitée."
  		redirect_to preorder_project_path(project)
	end



	def paid_project
	  	project = PaidProject.find(params[:paid_project_id])

	  	if Payment.where(paymentable: project, user: current_user).exists? 
	  		flash[:error] = "La formation a déjà été achetée"
	  		redirect_to paid_project_path(project)
	  	else
		  	# Amount in cents
		  	amount = project.price * 100

		  	# Add verification of referral code
		  	# If correct, amount = amount - 500

		  	# Charge the user
		  	charge = Stripe::Charge.create(
			    :amount => amount.to_i, # amount in cents, again
			    :currency => "eur",
				:source => params[:stripeToken],
			  	:description => "Achat #{project.title} par #{current_user.email}",
			  	:receipt_email => current_user.email
			)

			if charge.paid 
				payment = Payment.create(paymentable: project, user: current_user, amount: amount/100, stripe_charge_id: charge.id)
		  		subscription = Subscription.create(subscriptionable: project, user: current_user)
		  		flash[:success] = "Paiement réussi ! Vous allez recevoir un email dans quelques instants."
		  	else
		  		flash[:error] = "Une erreur est survenue pendant le paiement. Votre carte n'a pas été débitée."
			end

			redirect_to paid_project_path(project)
	  	end
	rescue Stripe::CardError, Stripe::InvalidRequestError => e
		flash[:error] = "Une erreur est survenue pendant le paiement. Votre carte n'a pas été débitée."
  		redirect_to paid_project_path(project)		
	end

end
