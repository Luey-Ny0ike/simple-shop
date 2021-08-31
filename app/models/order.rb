class Order < ApplicationRecord
  # Associations
  belongs_to :customer
  has_many :order_items
end
