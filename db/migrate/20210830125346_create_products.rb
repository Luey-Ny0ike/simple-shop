class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :price
      t.integer :stock_number
      t.string :sku
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
