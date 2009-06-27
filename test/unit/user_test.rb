require 'test_helper'

class UserTest < ActiveSupport::TestCase

  should_be_authentic
  
  should_allow_mass_assignment_of :login, :password, :password_confirmation, :first_name, :last_name, :email
  should_not_allow_mass_assignment_of :crypted_password, :password_salt, :persistence_token, :login_count, :last_request_at, :last_login_at,
    :current_login_at, :last_login_ip, :current_login_ip, :admin, :created_at, :updated_at, :id, :approved
  
  context "#deliver_password_reset_instructions!" do
    setup do
      activate_authlogic
      @user = User.generate!
      Notifier.stubs(:deliver_password_reset_instructions)
    end
    
    should "reset the perishable token" do
      @user.expects(:reset_perishable_token!)
      @user.deliver_password_reset_instructions!
    end
    
    should "send the reset mail" do
      Notifier.expects(:deliver_password_reset_instructions).with(@user)
      @user.deliver_password_reset_instructions!
    end
  end
  
end



