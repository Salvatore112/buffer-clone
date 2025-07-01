class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      puts session[:user_id]
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in'
    else
      flash.now[:alert] = 'Incorrect login or password'
      render :new, status: :unprocessable_entity

    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end
end
