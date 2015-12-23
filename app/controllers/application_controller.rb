class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_login
  helper_method :logged_in?, :current_user
  rescue_from ActionController::RoutingError, :with => :rescue404
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  #render :file => 'public/404.html', :status => :not_found, :layout => false
  protected
    def ensure_login
      redirect_to login_path unless session[:user_id]
    end

    def logged_in?
      session[:user_id]
    end

    def current_user
      @current_user ||= User.find(session[:user_id])
    end


end
