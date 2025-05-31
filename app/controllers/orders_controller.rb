class OrdersController < BaseController
  before_action :authenticate_user!
  before_action :set_order, only: [:show]

  def index
    @orders = current_user.orders
  end

  def show;end

  def create
    cart = current_user.carts.find_by(status: :active)
    
    if cart && cart.cart_items.any?
      total = cart.cart_items.sum { |item| item.product.price * item.quantity }
      order = current_user.order.create(status: :pending, total: total)
      
      cart.cart_items.each do |item|
        order.order_items.create(
          product: item.product,
          quantity: item.quantity,
          price: item.product.price
        )
      end

      cart.update(status: :ordered)
      redirect_to order_path(order), notice: "Order placed successfully."
    else
      redirect_to cart_path(cart), alert: "Your cart is empty."
    end
  end

  private

    def set_order
      @order = current_user.orders.find(params[:id])
    end
end
