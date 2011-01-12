class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.string :subject, :null=>false
      t.string :content
      t.integer :estimated_hours, :null=>false, :default=>0
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :features
  end
end
