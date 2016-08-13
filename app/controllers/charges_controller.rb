class ChargesController < ApplicationController
	before_action :authenticate_user!
	before_action :retrieve_project, only: [:create]

	def new
	end

	def preorder_project
	  project = PreorderProject.find(params[:preorder_project_id])

	  if Payment.where(paymentable: project, user: current_user).exists?
	  	flash[:error] = "La formation a déjà été pré-commandée"
	  	redirect_to preorder_project_path(project)
	  end

	  # Amount in cents
	  amount = project.preorder_price * 100

	  # TO DO : Add verification of referral code
	  # If correct, amount = amount - 500

	  payment = Payment.new(paymentable: project, user: current_user, amount: amount/100)

	  if payment.save 
	  	charge = Stripe::Charge.create(
		    :amount => amount.to_i, # amount in cents, again
		    :currency => "eur",
			:source => params[:stripeToken],
		  	:description => "Précommande de la formation #{project.title} par #{current_user.email}"
		)

		  if charge.paid
		  	payment.stripe_charge_id = charge.id
		  	payment.save
		  	flash[:success] = "Paiement réussi ! Vous allez recevoir un email dans quelques instants."
		  end
	  end

	  redirect_to preorder_project_path(project)

	rescue Stripe::CardError => e
		payment.destroy
	  	flash[:error] = "Une erreur est survenue pendant le paiement. Votre carte n'a pas été débitée."
	  	redirect_to preorder_project_path(project)
	end

	def paid_project
	  project = PaidProject.find(params[:paid_project_id])

	  if Payment.where(paymentable: project, user: current_user).exists? 
	  	flash[:error] = "La formation a déjà été achetée"
	  	redirect_to paid_project_path(project)
	  end

	  # Amount in cents
	  amount = project.price * 100

	  # Add verification of referral code
	  # If correct, amount = amount - 500

	  payment = Payment.new(paymentable: project, user: current_user, amount: amount/100)
	  subscription = Subscription.new(subscriptionable: project, user: current_user)

	  if payment.save && subscription.save
		  charge = Stripe::Charge.create(
		    :amount => amount.to_i, # amount in cents, again
		    :currency => "eur",
		    :source => params[:stripeToken],
		    :description => "Achat de la formation #{project.title} par #{current_user.email}"
		  )

		  if charge.paid
		  	payment.stripe_charge_id = charge.id
		  	payment.save
		  	flash[:success] = "Paiement réussi ! Vous allez recevoir un email dans quelques instants."	
		  end
	  end

	  redirect_to paid_project_path(project)

	rescue Stripe::CardError => e
		payment.destroy
		subscription.destroy
	  	flash[:error] = "Une erreur est survenue pendant le paiement. Votre carte n'a pas été débitée."
	  	redirect_to paid_project_path(project)
	end

end
