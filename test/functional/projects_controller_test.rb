require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  
  should_have_before_filter :require_user, :except => [ :index, :show ]
  should_have_before_filter :find_project, :only => [ :show, :edit, :update, :destroy ]

  context "on GET to :index" do
    setup do
      @the_project = Project.generate!
      Project.stubs(:all).returns([@the_project])
      get :index
    end
    
    should_assign_to(:projects) { [@the_project] }
    should_assign_to(:page_title) { "RailsBridge Projects" }
    should_respond_with :success
    should_render_template :index
    should_not_set_the_flash
  end
  
  context "on GET to :show" do
    setup do
      @the_project = Project.generate!
      get :show, :id => @the_project.id
    end
    
    should_assign_to(:project) { @the_project }
    should_assign_to(:page_title) { @the_project.name }
    should_respond_with :success
    should_not_set_the_flash
    should_render_template :show
  end

  context "on GET to :new" do
    setup do
      controller.stubs(:require_user).returns(true)
      @the_project = Project.generate!
      Project.stubs(:new).returns(@the_project)
      get :new
    end
    
    should_assign_to(:project) { @the_project }
    should_assign_to(:page_title) { "New RailsBridge Project" }
    should_respond_with :success
    should_render_template :new
    should_not_set_the_flash
  end

  context "on POST to :create" do
    setup do
      controller.stubs(:require_user).returns(true)
      @the_project = Project.generate!
      Project.stubs(:new).returns(@the_project)
    end
    
    context "with successful creation" do
      setup do
        @the_project.stubs(:save).returns(true)
        post :create, :project => { :name => "New Project" }
      end

      should_assign_to(:project) { @the_project }
      should_respond_with :redirect
      should_set_the_flash_to "Project was successfully created."
      should_redirect_to("the project page") { project_url(@the_project) }
    end
    
    context "with failed creation" do
      setup do
        @the_project.stubs(:save).returns(false)
        post :create, :project => { :name => "New Project" }
      end
      
      should_assign_to(:project) { @the_project }
      should_respond_with :success
      should_not_set_the_flash
      should_render_template :new
    end
  end
  
  context "on GET to :edit" do
    setup do
      controller.stubs(:require_user).returns(true)
      @the_project = Project.generate!
      Project.stubs(:find).with(@the_project.id.to_s).returns(@the_project)
      get :edit, :id => @the_project.id
    end
    
    should_assign_to(:project) { @the_project }
    should_assign_to(:page_title) { "Edit #{@the_project.name}"}
    should_respond_with :success
    should_not_set_the_flash
    should_render_template :edit
  end

  context "on PUT to :update" do
    setup do
      controller.stubs(:require_user).returns(true)
      @the_project = Project.generate!
      Project.stubs(:find).with(@the_project.id.to_s).returns(@the_project)
    end

    context "with successful update" do
      setup do
        Project.any_instance.stubs(:update_attributes).returns(true)
        put :update, :id => @the_project.id, :project => { :id => @the_project.id, :name => "New Name" }
      end
      
      should_assign_to(:project) { @the_project }
      should_respond_with :redirect
      should_set_the_flash_to "Project was successfully updated."
      should_redirect_to("the project page") { project_url(@the_project) }
    end
    
    context "with failed update" do
      setup do
        Project.any_instance.stubs(:update_attributes).returns(false)
        put :update, :id => @the_project.id, :project => { :id => @the_project.id, :name => "New Name" }
      end
      
      should_assign_to(:project) { @the_project }
      should_respond_with :success
      should_not_set_the_flash
      should_render_template :edit
    end
  end
  
  context "on DELETE to :destroy" do
    setup do
      controller.stubs(:require_user).returns(true)
      @the_project = Project.generate!
      Project.stubs(:find).with(@the_project.id.to_s).returns(@the_project)
      delete :destroy, :id => @the_project.id
    end
    
    should_respond_with :redirect
    should_set_the_flash_to "Project was deleted."
    should_redirect_to("the projects page") { projects_path }
  end
  
end
