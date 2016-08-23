class ReferralController < ApplicationController
	include ReferralHelper

	before_action :authenticate_user!
	respond_to :js

	def verify_availability
		response = Hash.new

		if is_referral_code_owner(params[:referral_code])
			response[:code] = "referral_code_owner"
			response[:message] = "Vous ne pouvez pas utiliser votre propre code de parrainage."
		elsif has_already_use_referral_code(params[:referral_code])
			response[:code] = "referral_code_already_used"
			response[:message] = "Ce code a déjà été utilisé"
		elsif !is_unknown_referral_code(params[:referral_code])
			response[:code] = "referral_code_unknown"
			response[:message] = "Ce code est indisponible"
		else
			parrain = User.where(referral_code: params[:referral_code]).first
			response[:code] = "referral_code_available"
			response[:message] = "Vous économisez #{Gon.global.referral_amount}€ grâce à #{parrain.first_name} !"
		end

		respond_to do |format|
			format.json { render json: response }
		end
	end

end
