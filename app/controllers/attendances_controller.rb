class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end

  def create
    user = User.find_by(name: attendance_params[:name])
    @event = Event.find(attendance_params[:id])
    current_event = @event.attendees.exists?(id: user.id)
    if user && !current_event
      user.attended_events << @event
      redirect_to event_path(@event), notice: 'Invitation send successfully'
    else
      flash[:alert] = if user && @event.attendees.find(user.id)
                        'This user is already invited'
                      else
                        "This user doesn't exist"
                      end
      render 'events/show'
    end
  end

  def destroy; end

  private

  def attendance_params
    params.require(:attendance).permit(:name, :id)
  end
end
