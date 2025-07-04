class Admin::ClientsController < Admin::BaseAdminController
  def index
    per_page = params[:per].presence || 10
    @clients = User.clients.page(params[:page]).per(per_page)
  end
end
