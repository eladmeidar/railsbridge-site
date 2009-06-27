class User < ActiveRecord::Base
  acts_as_authentic
  
  attr_accessible :login, :password, :password_confirmation, :first_name, :last_name, :email
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
  
end
