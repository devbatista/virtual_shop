class Admin::CategoriesController < Admin::BaseAdminController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.page(params[:page]).per(10)
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to(admin_category_path(@category), notice: "Category created successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to(admin_category_path(@category), notice: "Category updated successfully")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to(admin_categories_path, notice: "Category deleted")
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :parent_id)
    end
end
