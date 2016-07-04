class Question < ActiveRecord::Base
  belongs_to :category
  
  has_many :results, dependent: :destroy
  has_many :answers, dependent: :destroy
end
