class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.string :title
      t.text :country_details
      t.text :currency_details
      t.text :tax_details

      t.timestamps
    end
  end
end
