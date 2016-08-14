module ReferralHelper
	def is_valid_referral_code(referral_code)
		if is_referral_code_owner(referral_code) || has_already_use_referral_code(referral_code) || !is_unknown_referral_code(referral_code)
			return false
		else
			return true
		end
	end

	def is_referral_code_owner(referral_code)
		current_user.referral_code == referral_code
	end

	def has_already_use_referral_code(referral_code)
		current_user.payments.where(referral_code: referral_code).exists?
	end

	def is_unknown_referral_code(referral_code)
		User.where(referral_code: referral_code).exists?
	end
end
