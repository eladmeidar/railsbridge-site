class PagesController < ApplicationController
  
  def home
    @page_title = 'RailsBridge'
    @projects = Project.all.shuffle
    @news_items = NewsItem.all(:order => "created_at DESC", :limit => 2)
  end
  
  def css_test
    @page_title = "CSS Test"
  end
  
  def mission
    @page_title = "The RailsBridge Mission"
  end
  
  def help
    @page_title = "Get Involved"
  end
  
  def about
    @page_title = "About RailsBridge"
  end
  
end
