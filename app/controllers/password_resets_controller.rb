class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    puts '*************************'
    puts @user.email
    puts '*************************'

    if @user.present?
      # send email
    end

    redirect_to root_path, notice: 'Email has been sent! Check your inbox'
  end
end
