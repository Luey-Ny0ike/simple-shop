json.extract! order, :id, :full_name, :email, :total_amount, :created_at, :updated_at
json.order_items(order.order_items) do |order_item|
  json.products do
    json.extract! order_item.product, :id, :title, :price, :sku
  end
end
json.url api_v1_order_url(order, format: :json)
