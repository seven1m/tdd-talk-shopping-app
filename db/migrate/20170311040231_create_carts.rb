class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.string :random_id, limit: 100

      t.timestamps
    end
  end
end
