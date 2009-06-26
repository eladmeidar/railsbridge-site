class Notifier < ActionMailer::Base
  default_url_options[:host] = "railsbridge.org"
  
  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          "RailsBridge <noreply@railsbridge.org>"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end
end
