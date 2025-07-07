class RenameStorageToStorageIdInProducts < ActiveRecord::Migration[7.1]
  def change
    rename_column :products, :storage, :storage_id
  end
end
