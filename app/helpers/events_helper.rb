module EventsHelper
  def invite_or_attend(event)
    if user_signed_in? && event_creator?(event)
      render partial: 'events/invite'
    elsif user_signed_in? && !event_creator?(event)
      render partial: 'events/attend'
    end
  end
end
