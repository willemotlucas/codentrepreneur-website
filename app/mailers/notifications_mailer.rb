class NotificationsMailer < ApplicationMailer
	default from: "notifications@codentrepreneur.fr"

	def notify_use_referral_code(referee, referent)
		@referee = referee
		@referent = referent

		mail to: referent.email, subject: "Génial, vous venez de gagner 5€ sur Codentrepreneur !"
	end
end
