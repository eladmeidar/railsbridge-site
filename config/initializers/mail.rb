#TODO: Need to sort this out for railsbridge
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "111.111.111.111",
  :port => 25,
  :domain => "railsbridge.org",
  :authentication => :login,
  :user_name => "user",
  :password => "password"  
}

