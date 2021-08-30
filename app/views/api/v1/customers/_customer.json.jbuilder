json.extract! customer, :id, :first_name, :last_name, :email, :created_at, :updated_at
json.url api_v1_customer_url(customer, format: :json)
