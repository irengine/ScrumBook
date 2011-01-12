class CreateSprints < ActiveRecord::Migration
  def self.up
    create_table :sprints do |t|
      t.string :code
      t.date :begin_date
      t.date :end_date
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sprints
  end
end
