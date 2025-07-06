module Admin::ProductsHelper
  def category_options
    Category.all.collect { |c| [c.name, c.id] }
  end

  def storage_options
    Storage.all.collect { |s| [s.name, s.id] }
  end
end
