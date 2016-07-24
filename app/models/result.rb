class Result < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer
  belongs_to :lesson

  def question
    question = Question.find_by_id answer.question.id
  end

  def right_answer
    question.answers.where(is_correct: true)
  end
end
