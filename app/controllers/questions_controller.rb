class QuestionsController < ApplicationController
  before_action :logged_in_user

  def index
     @questions = Question.all.paginate page: params[:page]
  end
end
