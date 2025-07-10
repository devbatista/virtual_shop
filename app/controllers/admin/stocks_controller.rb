class Admin::StocksController < Admin::BaseAdminController
  before_action :set_product, only: [:new, :create]
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  def index
    @stocks = ProductStock.includes(:product).all
  end

  def show;end

  def new
    @stock = @product.stock.build
  end

  def create
    @stock = @product.stock.build(stock_params)
    if @stock.save
      redirect_to admin_stock_path(@stock), notice: "Estoque criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit;end

  def update
    if @stock.update(stock_params)
      redirect_to admin_stock_path(@stock), notice: "Estoque atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @stock.destroy
    redirect_to admin_stocks_path, notice: "Estoque removido com sucesso."
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_stock
      @stock = ProductStock.find(params[:id])
    end

    def stock_params
      params.require(:product_stock).permit(:quantity, :color_id, :storage_id)
    end
end