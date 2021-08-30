json.extract! customer, :id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
json.url api_v1_customer_url(customer, format: :json)
