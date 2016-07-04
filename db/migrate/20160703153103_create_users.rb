class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.string :name
    t.string :password
    t.string :avatar
    t.boolean :is_admin
    t.timestamps null: false
    end
  end
  add_index :users, [:name]
end
