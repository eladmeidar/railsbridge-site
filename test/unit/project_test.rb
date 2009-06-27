require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  should_have_attached_file :site_image
  
  should_allow_mass_assignment_of :name, :short_description, :link, :long_description, :team_lead, :team_lead_email
  should_not_allow_mass_assignment_of :created_at, :updated_at, :id
  
end
