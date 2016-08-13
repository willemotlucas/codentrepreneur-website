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

	  # customer = Stripe::Customer.create(
	  #   :email => current_user.email,
	  #   :source  => params[:stripeToken]
	  # )

	  charge = Stripe::Charge.create(
	    :amount => amount.to_i, # amount in cents, again
	    :currency => "eur",
	    :source => params[:stripeToken],
	    :description => "Achat de la formation #{project.title}"
	  )

	  if charge
	  	Payment.create(paymentable: project, user: current_user, amount: amount/100)
	  	flash[:success] = "Paiement réussi ! Vous allez recevoir un email dans quelques instants"
	  end

	  redirect_to preorder_project_path(project)

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to preorder_project_path(project)
	end

	def paid_project
	  project = PaidProject.find(params[:preorder_project_id])

	  # Amount in cents
	  amount = project.price * 100

	  # Add verification of referral code
	  # If correct, amount = amount - 500

	  charge = Stripe::Charge.create(
	    :amount => amount.to_i, # amount in cents, again
	    :currency => "eur",
	    :source => params[:stripeToken],
	    :description => "Achat de la formation #{project.title}"
	  )

	  if charge
	  	Payment.create(paymentable: project, user: current_user, amount: amount/100)
	  	Subscription.create(subscriptionable: project, user: current_user)
	  	flash[:success] = "Paiement réussi ! Vous allez recevoir un email dans quelques instants"
	  end

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to paid_project_path(project)
	end

end
