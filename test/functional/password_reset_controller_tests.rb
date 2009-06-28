require 'test_helper'

class PasswordResetsControllerTest < ActionController::TestCase

  should_have_before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  should_have_before_filter :require_no_user

  context "on GET to :new" do
    setup do
      controller.stubs(:require_no_user).returns(true)
      get :new
    end
    
    should_assign_to(:page_title) { "Forgot Password?" }
    should_respond_with :success
    should_render_template :new
    should_not_set_the_flash
  end

  context "on POST to :create" do
    setup do
      Notifier.stubs(:deliver_password_reset_instructions)
      controller.stubs(:require_no_user).returns(true)
    end

    context "with user not found" do
      setup do
        User.stubs(:find_by_email).returns(nil)
        post :create, :email => "foo@example.com"
      end

      should_respond_with :success
      should_set_the_flash_to "No user was found with that email address"
      should_render_template :new
    end
    
    context "with user found" do
      setup do
        @user = User.generate!(:email => "foo@example.com")
        post :create, :email => "foo@example.com"
      end
      
      should_respond_with :redirect
      should_set_the_flash_to "Instructions to reset your password have been emailed to you. " +
        "Please check your email."
      should_redirect_to("the home page") { root_url }
    end
  end

  context "on GET to :edit" do
    setup do
      controller.stubs(:require_no_user).returns(true)
      @user = User.generate!
      User.stubs(:find_using_perishable_token).returns(@user)
      get :edit, :id => "the token"
    end
    
    should_assign_to(:page_title) { "Select a New Password" }
    should_respond_with :success
    should_render_template :edit
    should_not_set_the_flash
  end

  context "on PUT to :update" do
    setup do
      controller.stubs(:require_no_user).returns(true)
      @user = User.generate!
      User.stubs(:find_using_perishable_token).returns(@user)
    end
    
    context "with successful save" do
      setup do
        User.any_instance.stubs(:save).returns(true)
        put :update, :id => "the token", :user => {:password => "the new password", :password_confirmation => "the new password"}
      end

      should_respond_with :redirect
      should_set_the_flash_to "Password successfully updated"
      should_redirect_to("the user's page") { account_url }
    end
    
    context "with failed save" do
      setup do
        User.any_instance.stubs(:save).returns(false)
        put :update, :id => "the token", :user => {:password => "the new password", :password_confirmation => "the new password"}
      end

      should_respond_with :success
      should_not_set_the_flash
      should_render_template :edit
    end
  end
end

