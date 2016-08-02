class DeviseMailer < Devise::Mailer

  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def confirmation_instructions(user, confirmation_token)
  	@user = user
  	@confirmation_token = confirmation_token

    mail to: user.email, subject: "Confirmation de votre inscription sur Codentrepreneur"
  end

  def reset_password_instructions(user, reset_password_token)
  	@user = user
  	@reset_password_token = reset_password_token

    mail to: user.email, subject: "Réinitialisation de votre mot de passe"
  end
end