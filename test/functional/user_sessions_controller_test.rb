require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  should_have_before_filter :require_no_user, :only => [:new, :create]
  should_have_before_filter :require_user, :only => :destroy

  context "on GET to :new" do
    setup do
      controller.stubs(:require_no_user).returns(true)
      @the_user_session = UserSession.new
      UserSession.stubs(:new).returns(@the_user_session)
      get :new
    end
    
    should_assign_to(:user_session) { @the_user_session }
    should_respond_with :success
    should_render_template :new
    should_not_set_the_flash
  end

  context "on POST to :create" do
    setup do
      controller.stubs(:require_no_user).returns(true)
      @the_user_session = UserSession.new
      UserSession.stubs(:new).returns(@the_user_session)
    end
    
    context "with successful creation" do
      setup do
        @the_user_session.stubs(:save).returns(true)
        post :create, :user_session => { :login => "bobby", :password => "bobby" }
      end

      should_assign_to(:user_session) { @the_user_session }
      should_respond_with :redirect
      should_set_the_flash_to "Login successful!"
      should_redirect_to("the user's account") { account_url }
    end
    
    context "with failed creation" do
      setup do
        @the_user_session.stubs(:save).returns(false)
        post :create, :user_session => { :login => "bobby", :password => "bobby" }
      end
      
      should_assign_to(:user_session) { @the_user_session }
      should_respond_with :success
      should_not_set_the_flash
      should_render_template :new
    end
  end
  
  context "on DELETE to :destroy" do
    setup do
      @the_user = User.generate!
      UserSession.create(@the_user)
      delete :destroy
    end
    
    should_respond_with :redirect
    should_set_the_flash_to "Logout successful!"
    should_redirect_to("the login page") { new_user_session_url }
  end
  
end