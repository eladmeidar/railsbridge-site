class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.string :short_description
      t.string :link
      t.text :long_description
      t.string :team_lead
      t.string :team_lead_email
      t.string :site_image_file_name
      t.string :site_image_content_type
      t.integer :site_image_size
      t.datetime :site_image_updated_ad

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
