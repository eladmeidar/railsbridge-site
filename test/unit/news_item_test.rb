require 'test_helper'

class NewsItemTest < ActiveSupport::TestCase
  
  should_allow_mass_assignment_of :headline, :lede, :body
  should_not_allow_mass_assignment_of :created_at, :updated_at, :id
  
end
