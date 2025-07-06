module Admin::ProductsHelper
  def category_options
    Category.all.collect { |c| [c.name, c.id] }
  end

  def storage_options
    Storage.all.collect { |s| [s.value, s.id] }
  end

  def color_options
    Color.all
  end
end
