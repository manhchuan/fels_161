class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
    t.references :question, index: true, foreign_key: true
    t.references :answer, index: true, foreign_key: true
    t.references :lesson, index: true, foreign_key: true
    t.timestamps null: false
    end
    add_index :results, [:question_id, :answer_id,:lesson_id]
  end
end
