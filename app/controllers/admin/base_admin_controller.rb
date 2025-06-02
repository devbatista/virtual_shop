class Admin::BaseAdminController < BaseController
  before_action :authorize_admin!
end
