json.extract! product, :id, :title, :image, :description, :stock_number, :price, :sku, :region_id, :created_at, :updated_at
json.url api_v1_product_url(product, format: :json)
