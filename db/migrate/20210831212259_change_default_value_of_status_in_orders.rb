class ChangeDefaultValueOfStatusInOrders < ActiveRecord::Migration[6.0]
  def change
    change_column_default :orders, :status, from: false, to: "incomplete"
  end
end
