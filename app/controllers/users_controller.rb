class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to @user, notice: 'You are successfully Sing up'
    else
      render :new, alert: 'This username is taken'
    end
  end

  def show
    @user = User.find(params[:id])
    @created_events = current_user.created_events
    @past_events = current_user.attended_events.past
    @upcoming_events = current_user.attended_events.upcoming
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
