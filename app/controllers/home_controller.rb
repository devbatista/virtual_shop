class HomeController < BaseController
  def index
    @products = Product.all
  end
end
