class AddTeamLeadToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :team_lead, :boolean
  end

  def self.down
    remove_column :users, :team_lead
  end
end
