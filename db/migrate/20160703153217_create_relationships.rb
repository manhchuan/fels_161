class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
    t.integer :followed_id
    t.integer :follower_id
    t.timestamps null: false
    end
  end
  add_index :relationships, [:follower_id, :followed_id]
end
