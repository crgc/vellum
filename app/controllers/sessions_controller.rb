class SessionsController < ApplicationController
  def new; end

  def create
    username = params[:name]
    username = username.delete_prefix('@')

    @user = User.find_by(name: username)

    if @user
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      flash[:alert] = 'Invalid username.'
      redirect_to '/login'
    end
  end

  def login; end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
