ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "72.249.191.186",
  :port => 25,
  :domain => "larkfarm.com",
  :authentication => :login,
  :user_name => "mikeg1@larkfarm.com",
  :password => "23Wombat#"  
}

# base64 encodings:
# username => bWlrZWcxQGxhcmtmYXJtLmNvbQ==
# password => MjNXb21iYXQj
