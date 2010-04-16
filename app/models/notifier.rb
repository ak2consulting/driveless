class Notifier < ActionMailer::Base
  default_url_options[:host] = "driveless.heroku.com"

  def password_reset_instructions(user)
    subject       "Password Reset for Driveless"
    from          "Driveless Challenge"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end
end
