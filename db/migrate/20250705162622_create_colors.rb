class CreateColors < ActiveRecord::Migration[7.1]
  def change
    create_table :colors, id: :uuid do |t|
      t.string :name, null: false
      t.string :hex, null: false
    end
  end
end
