class RemoveColorAndStorageFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_reference :products, :color, type: :uuid
    remove_reference :products, :storage, type: :uuid
  end
end
