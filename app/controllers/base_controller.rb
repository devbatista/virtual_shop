class BaseController < ApplicationController
  helper_method :current_user

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authorize_admin!
      unless current_user&.admin?
        redirect_to login_path, alert: "Access restricted to administrators."
      end
    end
end