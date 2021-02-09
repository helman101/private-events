module EventsHelper
  def invite_or_attend(event)
    if user_signed_in? && event_creator?(event)
      render partial: 'events/invite'
    elsif user_signed_in? && !event_creator?(event)
      render partial: 'events/attend'
    end
  end

  def attendee_name(event)
    render partial: 'shared/attendee', collection: event.attendees
  end

  def events_upcoming(events)
    render partial: 'events/upcoming', collection: events
  end

  def events_past(events)
    render partial: 'events/past', collection: events
  end
end
