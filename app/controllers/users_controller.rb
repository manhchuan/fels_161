class UsersController < ApplicationController
  before_action :logged_in_user, only:[:index, :create]
  before_action :find_user, only: :show
  def new
    @user = User.new
  end

  def show
    @active = if current_user.following? @user
      current_user.active_relationships.find_by followed_id: @user.id
    else 
      current_user.active_relationships.build
    end
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "sigged_flash" 
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email,
      :password, :password_confirmation
  end

  def find_user
    @user = User.find_by_id params[:id]
    if @user.nil?
      redirect_to root_path
      flash[:danger] = t :find_error
    end
  end
end
