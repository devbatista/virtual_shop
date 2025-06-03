class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :name
      t.uuid :parent_id, index: true

      t.timestamps
    end

    add_foreign_key :categories, :categories, column: :parent_id
  end
end
