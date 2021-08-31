json.extract! order, :id, :full_name, :email, :total_amount, :created_at, :updated_at
json.url api_v1_order_url(order, format: :json)
