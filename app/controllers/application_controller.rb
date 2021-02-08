class ApplicationController < ActionController::Base
  helper_method :user_signed_in?
  helper_method :current_user
  helper_method :event_creator?

  def event_creator?
    current_user.id == @event.creator.id
  end

  def user_signed_in?
    !session[:current_user_id].nil?
  end

  def current_user
    User.find(session[:current_user_id])
  end
end
