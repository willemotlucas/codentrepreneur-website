class ChargesController < ApplicationController
	include ReferralHelper

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
		  	amount = project.price * 100

		  	referral_code = params[:referral_code]
		  	use_referral_code = false
		  	if !referral_code.blank? && is_valid_referral_code(referral_code)
		  		use_referral_code = true
		  		amount -= Gon.global.referral_amount * 100
		  	end

		  	# Check if user use his referral amount
		  	use_referral_wallet = params[:use_referral_wallet] == "true" ? true : false
		  	if !use_referral_code && use_referral_wallet
		  		amount -= current_user.referral_wallet * 100
		  		if amount <= 0
		  			current_user.referral_wallet = amount.abs / 100
		  			amount = 0
		  		else
		  			current_user.referral_wallet = 0
		  		end
		  	end

			# Charge the user if amount > 0
			if amount > 0
			  	charge = Stripe::Charge.create(
				    :amount => amount.to_i, # amount in cents, again
				    :currency => "eur",
					:source => params[:stripeToken],
				  	:description => "Précommande #{project.title} par #{current_user.email}",
				  	:receipt_email => current_user.email
				)
			end

			if amount == 0 || charge.paid
				payment = Payment.new(paymentable: project, user: current_user, amount: amount/100)
				payment.stripe_charge_id = charge.id if charge != nil
				if use_referral_code
					payment.referral_code = referral_code

					# Increase referral balance of 5€ for the referant
					referent = User.where(referral_code: referral_code).first
					if referent != nil
						referent.referral_wallet += Gon.global.referral_amount
						referent.save
						NotificationsMailer.notify_use_referral_code(current_user, referent).deliver_later
					end
				end
				if use_referral_wallet
					payment.referral_wallet_amount = project.price - (amount / 100)
		  			current_user.save
				end
				payment.save
				flash[:success] = "Paiement réussi ! Vous allez recevoir un email dans quelques instants." if charge != nil && charge.paid == true
				flash[:success] = "Génial, vous avez bien précommandé la formation GRATUITEMENT !" if amount == 0
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

		  	referral_code = params[:referral_code]
		  	use_referral_code = false
		  	if !referral_code.blank? && is_valid_referral_code(referral_code)
		  		use_referral_code = true
		  		amount -= Gon.global.referral_amount * 100
		  	end

		  	# Check if user use his referral amount
		  	use_referral_wallet = params[:use_referral_wallet] == "true" ? true : false
		  	if !use_referral_code && use_referral_wallet
		  		amount -= current_user.referral_wallet * 100
		  		if amount <= 0
		  			current_user.referral_wallet = amount.abs / 100
		  			amount = 0
		  		else
		  			current_user.referral_wallet = 0
		  		end
		  	end

			# Charge the user if amount > 0
			if amount > 0
			  	charge = Stripe::Charge.create(
				    :amount => amount.to_i, # amount in cents, again
				    :currency => "eur",
					:source => params[:stripeToken],
				  	:description => "Achat #{project.title} par #{current_user.email}",
				  	:receipt_email => current_user.email
				)
			end

			if amount == 0 || charge.paid
				payment = Payment.new(paymentable: project, user: current_user, amount: amount/100)
				payment.stripe_charge_id = charge.id if charge != nil				
				if use_referral_code
					payment.referral_code = referral_code

					# Increase referral balance of 5€ for the referant
					referent = User.where(referral_code: referral_code).first
					if referent != nil
						referent.referral_wallet += Gon.global.referral_amount
						referent.save
						# TODO: Send an email to notify the increase
					end
				end
				if use_referral_wallet
					payment.referral_wallet_amount = project.price - (amount / 100)
		  			current_user.save
				end
				payment.save
		  		subscription = Subscription.create(subscriptionable: project, user: current_user)
				flash[:success] = "Paiement réussi ! Vous allez recevoir un email dans quelques instants." if charge != nil && charge.paid == true
				flash[:success] = "Génial, vous avez bien obtenu la formation GRATUITEMENT !" if amount == 0
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
