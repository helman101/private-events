module ApplicationHelper
  def navbar
    if user_signed_in?
      render partial: 'shared/signed_in_navbar'
    else
      render partial: 'shared/signed_out_navbar'
    end
  end

  def alerts
    if flash[:notice]
      render partial: 'shared/notice'
    elsif flash[:alert]
      render partial: 'shared/alert'
    end
  end

  def event_creator?(event)
    current_user.id == event.creator.id
  end

  def user_signed_in?
    !session[:current_user_id].nil?
  end

  def current_user
    User.find(session[:current_user_id])
  end
end
