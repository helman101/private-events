class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: session_params[:name])
    if user
      session[:current_user_id] = user.id
      redirect_to user, notice: 'You Sign In succesfully'
    else
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path, alert: 'You Sign out'
  end

  private

  def session_params
    params.require(:session).permit(:name)
  end
end
