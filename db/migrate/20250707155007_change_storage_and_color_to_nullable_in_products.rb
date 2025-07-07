class ChangeStorageAndColorToNullableInProducts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :products, :storage_id, true
    change_column_null :products, :color_id, true
  end
end