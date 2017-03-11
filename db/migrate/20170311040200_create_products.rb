class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, limit: 50
      t.string :description, limit: 1000
      t.decimal :cost

      t.timestamps
    end
  end
end
