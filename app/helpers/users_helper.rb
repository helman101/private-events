module UsersHelper
  def upcoming(events)
    render partial: 'users/upcoming', collection: events
  end

  def past(events)
    render partial: 'users/past', collection: events
  end

  def created(events)
    render partial: 'users/created', collection: events
  end
end
