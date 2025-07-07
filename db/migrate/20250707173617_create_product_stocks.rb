class CreateProductStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :product_stocks, id: :uuid do |t|
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.references :color, foreign_key: true, type: :uuid
      t.references :storage, foreign_key: true, type: :uuid
      t.integer :quantity, default: 0, null: false

      t.timestamps
    end
  end
end
