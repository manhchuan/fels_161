class Question < ActiveRecord::Base
  belongs_to :category
  
  has_many :results, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :name, presence: true, length: {maximum: 30}
  validate :check_answers

  accepts_nested_attributes_for :answers, allow_destroy: true

  def correct_answer
    answers.find_by question_id: id ,is_correct: true
  end

  private
  def check_answers
    correct_answer = answers.select {|answer| answer.is_correct?}
    errors.add(:answers, I18n.t(:must_check)) if correct_answer.empty?
  end
end
