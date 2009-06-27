class AddApprovedToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :approved, :boolean
  end

  def self.down
    remove_column :users, :approved
  end
end
