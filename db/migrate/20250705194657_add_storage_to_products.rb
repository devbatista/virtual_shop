class AddStorageToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :storage, :uuid
  end
end
