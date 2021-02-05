class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @user = User.find(session[:current_user_id])
    @event = @user.created_events.build(event_params)
    if @event.save
      @user.attended_events << @event
      redirect_to @user, notice: 'Event created successfully'
    else
      render :new 
    end
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date)
  end
end
