class Project < ActiveRecord::Base
  
  has_attached_file :site_image, :styles => { :thumb => "135x75>" }
  
  attr_accessible :name, :short_description, :link, :long_description, :team_lead, :team_lead_email
  
end
