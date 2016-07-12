class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def admin_user
    unless current_user.is_admin?
      flash[:danger] = t :not_admin
      redirect_to root_url
    end
  end
end
