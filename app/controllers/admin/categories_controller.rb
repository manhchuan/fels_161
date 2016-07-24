class Admin::CategoriesController < ApplicationController
  before_action :admin_user
  before_action :find_category, except: [:index, :new, :create]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end
  
  def show
    @category = Category.find_by_id params[:id]
    @questions = @category.questions.paginate page: params[:page]
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "category.create"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def update
    if @category.update category_params
      flash[:success] = t "category.updated"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private
  def find_category
    @category = Category.find_by_id params[:id]
    if @category.nil?
      flash[:danger] = t "category.fails"
      redirect_to admin_categories_path
    end
  end

  def category_params
    params.require(:category).permit :name
  end
end
