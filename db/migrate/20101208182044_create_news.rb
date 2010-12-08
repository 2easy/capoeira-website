class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string   :title
      t.text     :content
      t.datetime :published_at
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
