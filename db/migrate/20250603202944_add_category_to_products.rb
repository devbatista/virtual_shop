class AddCategoryToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :category, type: :uuid, foreign_key: true, index: true
  end
end
