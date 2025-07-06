class RenameNameToValueInStorages < ActiveRecord::Migration[7.1]
  def change
    rename_column :storages, :name, :value
  end
end
