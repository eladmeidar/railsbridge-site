class PagesController < ApplicationController
  
  def home
    @page_title = 'railsbridge-site'
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
