class DeviseMailerPreview < ActionMailer::Preview

  def confirmation_instructions
    DeviseMailer.confirmation_instructions(User.first, User.first.confirmation_token)
  end

  def reset_password_instructions
    DeviseMailer.reset_password_instructions(User.first, User.first.reset_password_token)
  end

  def unlock_instructions
    DeviseMailer.unlock_instructions(User.first, "faketoken")
  end

end