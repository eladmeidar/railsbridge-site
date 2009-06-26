class PagesController < ApplicationController
  
  def home
    @page_title = 'railsbridge-site'
  end
  
  def css_test
    @page_title = "CSS Test"
  end
  
end
