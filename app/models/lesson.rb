class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  
  has_many :results, dependent: :destroy
  has_many :question, through: :results

  accepts_nested_attributes_for :results
  
  def right_answers_count
    i = 0
    results.each do |result|
      (i = i+1) if result.answer.is_correct?
    end
    i
  end

end
