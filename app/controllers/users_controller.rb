class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :admin_required, :only => [:index, :destroy]
  
  def index
    @users = User.all
    @page_title = "All Users"
  end
  
  def new
    @user = User.new
    @page_title = "Create Account"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
    find_user
    @page_title = "#{@user.login} details"
  end

  def edit
    find_user
    @page_title = "Edit #{@user.login}"
  end
  
  def update
    find_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  def destroy
    find_user
    @user.destroy
    flash[:notice] = 'User was deleted.'
    redirect_to(users_url)  
  end

private

  def find_user
    if @current_user.admin? && params[:id]
      @user = User.find(params[:id])
    else
      @user = @current_user
    end
  end
  
end
