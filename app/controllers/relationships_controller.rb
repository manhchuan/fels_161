class RelationshipsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :show]
  def create
    @user = User.find_by_id params[:followed_id]
    if @user.nil?
      flash[:danger] = t "find_error"
      redirect_to root_url
    else
      current_user.follow @user
      redirect_to @user
    end
  end

  def destroy
    @user = Relationship.find_by_id(params[:id]).followed  
    if @user.nil?
      flash[:danger] = t "find_error"
      redirect_to root_url
    else
      current_user.unfollow @user
      redirect_to @user
    end
  end

  def show
    @user  = User.find params[:id]
    @title = t "#{params[:type]}"
    @users = @user.send(params[:type]).paginate page: params[:page]
  end
end
