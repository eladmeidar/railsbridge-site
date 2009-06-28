class ProjectsController < ApplicationController

  before_filter :require_approved_user, :except => [ :index, :show ]
  before_filter :find_project, :only => [ :show, :edit, :update, :destroy ]

  def index
    @projects = Project.all(:order => "name")
    @page_title = "RailsBridge Projects"
  end

  def show
    @page_title = @project.name
  end

  def new
    @project = Project.new
    @page_title = "New RailsBridge Project"
  end

  def edit
    @page_title = "Edit #{@project.name}"
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      flash[:notice] = 'Project was successfully created.'
      redirect_to(@project)
    else
      render :action => "new"
    end
  end

  def update
    if @project.update_attributes(params[:project])
      flash[:notice] = 'Project was successfully updated.'
      redirect_to(@project)
    else
      render :action => "edit"
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = 'Project was deleted.'
    redirect_to(projects_url)
  end
  
private

  def find_project
    @project = Project.find(params[:id])
  end
end
