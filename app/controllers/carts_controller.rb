class CartsController < BaseController
  before_action :authenticate_user!
  before_action :set_cart

  def show;end

  def edit;end

  private

    def set_cart
      @cart = current_user.carts.find_or_create_by(status: :active)
    end
end
