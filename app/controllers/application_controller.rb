class ApplicationController < ActionController::Base
  helper_method :user_signed_in?
  helper_method :current_user

  def user_signed_in?
    !session[:current_user_id].nil?
  end
  

  def current_user
    User.find(session[:current_user_id])
  end
end
