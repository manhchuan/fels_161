class RelationshipsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
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
end
