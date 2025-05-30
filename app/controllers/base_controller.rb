class BaseController < ApplicationController
  private

    def authorize_admin!
      unless current_user&.admin?
        redirect_to root_path, alert: "Access restricted to administrators."
      end
    end
end