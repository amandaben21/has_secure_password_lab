class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    @user = User.find_by(name: params[:name])
  end
  
  def require_login
    return redirect_to(controller: 'sessions', action: 'new') unless current_user != nil
  end
end