class MyAccountController < ApplicationController
	before_action :authenticate_user!

	def index
		@current_user = current_user
		@payments_as_referent = Payment.where(referral_code: current_user.referral_code)
	end
end
