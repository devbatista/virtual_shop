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
    @product.destroy
    redirect_to(admin_product_path(@product), notice: "Product deleted")
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :category_id)
    end
end
