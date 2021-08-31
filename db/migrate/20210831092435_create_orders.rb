class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :full_name
      t.string :email
      t.string :status, default: false
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
