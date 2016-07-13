class CategoriesController < ApplicationController
  before_action :logged_in_user

  def index
    @categories = Category.paginate page: params[:page],
      per_page: Settings.categories_per_page
  end

  def show
    @category = Category.find_by_id params[:id]
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
