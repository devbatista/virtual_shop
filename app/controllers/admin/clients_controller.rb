class Admin::ClientsController < Admin::BaseAdminController
  before_action :clients
  
  def index;end

  def show
    @client = clients.find(params[:id])
  end

  private

    def clients
      @clients ||= User.clients
    end
end
