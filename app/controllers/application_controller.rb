class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    return unless session[:user_id]

    Current.user = User.find_by(id: session[:user_id])
  end
  allow_browser versions: :modern

  private

  def require_user_logged_in!
    redirect_to sign_in_path, alert: 'You must be logged in' if Current.user.nil?
  end
end
