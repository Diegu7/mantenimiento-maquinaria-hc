class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authenticate
  helper_method :notification_count
  helper_method :notification

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def login(user)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def logout
    reset_session
    redirect_to login_path
  end

  def authenticate
    redirect_to login_path unless current_user
  end

  def notification_count
    @maintenance_notifications = MaintenanceNotification.all.count()
  end

  def notification
    @maintenance_notifications = MaintenanceNotification.all
  end

end
