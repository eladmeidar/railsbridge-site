require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  should_have_before_filter :require_no_user, :only => [:new, :create]
  should_have_before_filter :require_user, :only => [:show, :edit, :update]
  
  context "on GET to :new" do
    setup do
      controller.stubs(:require_no_user).returns(true)
      @the_user = User.generate!
      User.stubs(:new).returns(@the_user)
      get :new
    end
    
    should_assign_to(:user) { @the_user }
    should_respond_with :success
    should_render_template :new
    should_not_set_the_flash
  end

  context "on POST to :create" do
    setup do
      controller.stubs(:require_no_user).returns(true)
      @the_user = User.generate!
      User.stubs(:new).returns(@the_user)
    end
    
    context "with successful creation" do
      setup do
        @the_user.stubs(:save).returns(true)
        post :create, :user => { :login => "bobby", :password => "bobby", :password_confirmation => "bobby" }
      end

      should_assign_to(:user) { @the_user }
      should_respond_with :redirect
      should_set_the_flash_to "Account registered!"
      should_redirect_to("the user's account") { account_url }
    end
    
    context "with failed creation" do
      setup do
        @the_user.stubs(:save).returns(false)
        post :create, :user => { :login => "bobby", :password => "bobby", :password_confirmation => "bobby" }
      end
      
      should_assign_to(:user) { @the_user }
      should_respond_with :success
      should_not_set_the_flash
      should_render_template :new
    end
  end
  
  context "on GET to :show" do
    setup do
      @the_user = User.generate!
      UserSession.create(@the_user)
      get :show
    end
    
    should_assign_to(:user) { @current_user }
    should_respond_with :success
    should_not_set_the_flash
    should_render_template :show
  end

  context "on GET to :edit" do
    setup do
      @the_user = User.generate!
      UserSession.create(@the_user)
      get :edit
    end
    
    should_assign_to(:user) { @current_user }
    should_respond_with :success
    should_not_set_the_flash
    should_render_template :edit
  end

  context "on PUT to :update" do
    setup do
      @the_user = User.generate!
      UserSession.create(@the_user)
    end

    context "with successful update" do
      setup do
        User.any_instance.stubs(:update_attributes).returns(true)
        put :update, :user => { :login => "bill" }
      end
      
      should_assign_to(:user) { @current_user }
      should_respond_with :redirect
      should_set_the_flash_to "Account updated!"
      should_redirect_to("the user's account") { account_url }
    end
    
    context "with failed update" do
      setup do
        User.any_instance.stubs(:update_attributes).returns(false)
        put :update, :user => { :login => "bill" }
      end
      
      should_assign_to(:user) { @current_user }
      should_respond_with :success
      should_not_set_the_flash
      should_render_template :edit
    end
  end
  
end