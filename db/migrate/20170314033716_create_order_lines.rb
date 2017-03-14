class CreateOrderLines < ActiveRecord::Migration[5.0]
  def change
    create_table :order_lines do |t|
      t.belongs_to :order, foreign_key: true
      t.string :kind, null: false
      t.string :description, null: false
      t.decimal :amount, null: false
      t.integer :ordering, null: false

      t.timestamps
    end
  end
end
