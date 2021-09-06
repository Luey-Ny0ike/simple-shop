class Product < ApplicationRecord
  belongs_to :region

  # Validations
  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :description
  validates_presence_of :stock_number
  validates_presence_of :sku
end
