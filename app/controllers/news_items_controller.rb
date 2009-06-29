class NewsItemsController < ApplicationController

  before_filter :require_team_lead_user, :except => [ :index, :show ]
  before_filter :find_news_item, :only => [ :show, :edit, :update, :destroy ]

  def index
    @news_items = NewsItem.all(:order => "name")
    @page_title = "RailsBridge News Items"
  end

  def show
    @page_title = @news_item.headline
  end

  def new
    @news_item = NewsItem.new
    @page_title = "New RailsBridge News Item"
  end

  def edit
    @page_title = "Edit News Item"
  end

  def create
    @news_item = NewsItem.new(params[:news_item])

    if @news_item.save
      flash[:notice] = 'News Item was successfully created.'
      redirect_to(@news_item)
    else
      render :action => "new"
    end
  end

  def update
    if @news_item.update_attributes(params[:news_item])
      flash[:notice] = 'News Item was successfully updated.'
      redirect_to(@news_item)
    else
      render :action => "edit"
    end
  end

  def destroy
    @news_item.destroy
    flash[:notice] = 'News Item was deleted.'
    redirect_to(news_items_url)
  end
  
private

  def find_news_item
    @news_item = NewsItem.find(params[:id])
  end
end
