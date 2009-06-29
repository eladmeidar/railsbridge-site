class CreateNewsItems < ActiveRecord::Migration
  def self.up
    create_table :news_items do |t|
      t.string :headline
      t.text :lede
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :news_items
  end
end
