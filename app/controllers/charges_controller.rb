class ChargesController < ApplicationController
	def new
	end

	def create
	  preorder_project = PreorderProject.find(params[:preorder_project_id])

	  # Amount in cents
	  amount = preorder_project.price * 100

	  # Add verification of referral code
	  # If correct, amount = amount - 500



	  customer = Stripe::Customer.create(
	    :email => current_user.email,
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => amount,
	    :description => 'Achat de la formation #{preorder_project.title}',
	    :currency    => 'eur'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end
end
