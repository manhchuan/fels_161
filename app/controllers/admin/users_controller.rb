class Admin::UsersController < ApplicationController
  before_action :logged_in_user, :admin_user

  def index
    @users = User.all
  end

  def destroy
    @user = User.find_by_id params[:id]
    if @user.nil?
      flash[:danger] = t :error
    elsif @user.is_admin?
      flash[:danger] = t :error
    elsif @user.destroy
      flash[:success] = t :user_deleted
    end
    redirect_to admin_users_path
  end
end
