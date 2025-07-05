class AddColorToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :color_id, :uuid
    add_foreign_key :products, :colors
  end
end
