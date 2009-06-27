require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  
  should "send password reset instructions" do
    user = User.generate!
    Notifier.deliver_password_reset_instructions(user)
    assert_sent_email do |email|
      email.subject = "Password Reset Instructions"
      email.from.include?('RailsBridge <noreply@railsbridge.org>')
      email.to.include?(user.email)
      email.body =~ Regexp.new(user.perishable_token)
    end
  end
  
end
