class Admin::OrdersController < Admin::BaseAdminController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])  
  end
end
