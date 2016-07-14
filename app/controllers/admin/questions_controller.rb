class Admin::QuestionsController < ApplicationController
before_action :admin_user
before_action :find_question, only: [:show, :destroy]
  def new
    @categories = Category.all 
    @question = Question.new
    @question.answers.build
  end

  def index
    @questions = Question.all.paginate page: params[:page]
  end

  def show
    @question = Question.find_by_id params[:id]
    @answers = @question.answers.paginate page: params[:page]
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = t :create_question
      redirect_to new_admin_question_path
    else
      @categories = Category.all
      flash[:danger] = t :create_question_error  
      render :new
    end
  end

  def destroy
    @question.destroy
    flash[:success] = t :question_deleted
    redirect_to admin_questions_path
  end

  private
  def question_params
    params.require(:question).permit :name, :category_id,
      answers_attributes: [:name, :is_correct, :_destroy]
  end

  def find_question
    @question = Question.find_by_id params[:id]
    if @question.nil?
      flash[:danger] = :question_nil
      redirect_to admin_questions_path
    end
  end
end
