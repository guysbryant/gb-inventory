class CreateDepartmentTable < ActiveRecord::Migration
  def change
    create_table :department do |t|
      t.string :name 
      t.timestamps null: false
    end
  end
end
