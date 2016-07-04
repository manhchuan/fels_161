class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
    t.integer :action_type
    t.integer :target_id
    t.datetime :create_at
    t.references :user, index: true, foreign_key: true
    end
  end
  add_index :activities, [:user_id, :created_at, :action_type, :target_id]
end
