class CreateStorages < ActiveRecord::Migration[7.1]
  def change
    create_table :storages, id: :uuid do |t|
      t.string :name
    end
  end
end
