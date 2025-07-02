class Admin::ProductsController < Admin::BaseAdminController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show;end

  def new
    @product = Product.new  
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to(admin_product_path(@product), notice: "Product created successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit;end

  def update
    if @product.update(product_params)
      redirect_to(admin_product_path(@product), notice: "Product updated successfully")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    http_status = request.format.turbo_stream? ? :see_other : :found

    if @product.order_items.exists?
      redirect_to(admin_products_path, 
                  alert: "Cannot delete, the product has an associated order",
                  status: http_status)
    else
      @product.destroy
      redirect_to(admin_products_path, notice: "Product deleted", status: http_status)
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :category_id)
    end
end
