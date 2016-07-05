class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    t.string :name
    t.references :question, index: true, foreign_key: true
    t.boolean :is_correct
    t.timestamps null: false
    end
  end
end
