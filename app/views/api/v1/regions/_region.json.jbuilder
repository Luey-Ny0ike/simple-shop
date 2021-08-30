json.extract! region, :id, :created_at, :updated_at
json.url region_url(region, format: :json)
json.url api_v1_region_url(region, format: :json)
