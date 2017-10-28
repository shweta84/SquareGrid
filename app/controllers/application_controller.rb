class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :user_data

  def user_data
    @user = User.find_or_initialize_by(ip_add: request.remote_ip)
    unless @user.user_name
      @user.user_name = SecureRandom.hex(4)
      @user.save
    end
  end
end
