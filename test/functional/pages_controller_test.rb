require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  
  {:home => 'railsbridge-site',
   :css_test => 'CSS Test',
   :mission => 'The RailsBridge Mission',
   :help => 'Get Involved',
   :about => 'About RailsBridge'}.each do | page, page_title |
    context "on GET to :#{page.to_s}" do
      setup do
        get page
      end
    
      should_assign_to(:page_title) { page_title }
      should_respond_with :success
      should_not_set_the_flash
      should_render_template page
    end
  end
end