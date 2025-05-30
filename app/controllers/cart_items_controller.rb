class CartItemsController < BaseController
  before_action :authenticate_user!
  
  def create
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i

    result = @cart.add_product(product, quantity)

    if result
      redirect_to cart_path(@cart), notice: "Product added to cart."
    else
      redirect_to products_path, alert: "Não foi possível adicionar o produto ao carrinho."
    end
  end

  def update
    cart_item = @cart.cart_items.find(params[:id])
    if cart_item.update(quantity: params[:quantity])
      redirect_to cart_path(@cart), notice: "Updated quantity."
    else
      redirect_to cart_path(@cart), notice: "Unable to update quantity."
    end
  end

  def destroy
    cart_item = @cart.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_path(@cart), notice: "Item removed from cart."
  end

  private

    def set_cart
      @cart = current_user.carts.find_by(status: :active)
    end
end
