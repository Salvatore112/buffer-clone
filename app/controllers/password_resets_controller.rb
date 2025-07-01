class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    PasswordMailer.with(user: @user).reset.deliver_later if @user.present?

    redirect_to root_path, notice: 'Email has been sent! Check your inbox'
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue  ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: 'Link is expired!'
  end

  def update
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
    if @user.update(password_params)
      redirect_to sign_in_path, notice: 'Your password has been successfully changed!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
