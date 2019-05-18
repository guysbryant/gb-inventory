class CreateItemsTable < ActiveRecord::Migration
  def change 
    create_table :items do |t|
      t.string :name 
      t.integer :quantity
      t.string :details
      t.integer :department_id
      t.timestamps null: false
    end
  end
end
