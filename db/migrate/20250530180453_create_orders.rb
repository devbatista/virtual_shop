class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.decimal :total
      t.string :status

      t.timestamps
    end
  end
end
