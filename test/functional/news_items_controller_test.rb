require 'test_helper'

class NewsItemsControllerTest < ActionController::TestCase
  
  should_have_before_filter :require_team_lead_user, :except => [ :index, :show ]
  should_have_before_filter :find_news_item, :only => [ :show, :edit, :update, :destroy ]

  context "on GET to :index" do
    setup do
      @the_news_item = NewsItem.generate!
      NewsItem.stubs(:all).returns([@the_news_item])
      get :index
    end
    
    should_assign_to(:news_items) { [@the_news_item] }
    should_assign_to(:page_title) { "RailsBridge News Items" }
    should_respond_with :success
    should_render_template :index
    should_not_set_the_flash
  end
  
  context "on GET to :show" do
    setup do
      @the_news_item = NewsItem.generate!
      get :show, :id => @the_news_item.id
    end
    
    should_assign_to(:news_item) { @the_news_item }
    should_assign_to(:page_title) { @the_news_item.headline }
    should_respond_with :success
    should_not_set_the_flash
    should_render_template :show
  end

  context "on GET to :new" do
    setup do
      controller.stubs(:require_team_lead_user).returns(true)
      @the_news_item = NewsItem.generate!
      NewsItem.stubs(:new).returns(@the_news_item)
      get :new
    end
    
    should_assign_to(:news_item) { @the_news_item }
    should_assign_to(:page_title) { "New RailsBridge News Item" }
    should_respond_with :success
    should_render_template :new
    should_not_set_the_flash
  end

  context "on POST to :create" do
    setup do
      controller.stubs(:require_team_lead_user).returns(true)
      @the_news_item = NewsItem.generate!
      NewsItem.stubs(:new).returns(@the_news_item)
    end
    
    context "with successful creation" do
      setup do
        @the_news_item.stubs(:save).returns(true)
        post :create, :news_item => { :headline => "New News Item" }
      end

      should_assign_to(:news_item) { @the_news_item }
      should_respond_with :redirect
      should_set_the_flash_to "News Item was successfully created."
      should_redirect_to("the news_item page") { news_item_url(@the_news_item) }
    end
    
    context "with failed creation" do
      setup do
        @the_news_item.stubs(:save).returns(false)
        post :create, :news_item => { :headline => "New News Item" }
      end
      
      should_assign_to(:news_item) { @the_news_item }
      should_respond_with :success
      should_not_set_the_flash
      should_render_template :new
    end
  end
  
  context "on GET to :edit" do
    setup do
      controller.stubs(:require_team_lead_user).returns(true)
      @the_news_item = NewsItem.generate!
      NewsItem.stubs(:find).with(@the_news_item.id.to_s).returns(@the_news_item)
      get :edit, :id => @the_news_item.id
    end
    
    should_assign_to(:news_item) { @the_news_item }
    should_assign_to(:page_title) { "Edit News Item"}
    should_respond_with :success
    should_not_set_the_flash
    should_render_template :edit
  end

  context "on PUT to :update" do
    setup do
      controller.stubs(:require_team_lead_user).returns(true)
      @the_news_item = NewsItem.generate!
      NewsItem.stubs(:find).with(@the_news_item.id.to_s).returns(@the_news_item)
    end

    context "with successful update" do
      setup do
        NewsItem.any_instance.stubs(:update_attributes).returns(true)
        put :update, :id => @the_news_item.id, :news_item => { :id => @the_news_item.id, :headline => "New Headline" }
      end
      
      should_assign_to(:news_item) { @the_news_item }
      should_respond_with :redirect
      should_set_the_flash_to "News Item was successfully updated."
      should_redirect_to("the news_item page") { news_item_url(@the_news_item) }
    end
    
    context "with failed update" do
      setup do
        NewsItem.any_instance.stubs(:update_attributes).returns(false)
        put :update, :id => @the_news_item.id, :news_item => { :id => @the_news_item.id, :headline => "New Headline" }
      end
      
      should_assign_to(:news_item) { @the_news_item }
      should_respond_with :success
      should_not_set_the_flash
      should_render_template :edit
    end
  end
  
  context "on DELETE to :destroy" do
    setup do
      controller.stubs(:require_team_lead_user).returns(true)
      @the_news_item = NewsItem.generate!
      NewsItem.stubs(:find).with(@the_news_item.id.to_s).returns(@the_news_item)
      delete :destroy, :id => @the_news_item.id
    end
    
    should_respond_with :redirect
    should_set_the_flash_to "News Item was deleted."
    should_redirect_to("the news_items page") { news_items_path }
  end
  
end
