class OrderItem < ApplicationRecord
  # Associations
  belongs_to :order
  belongs_to :product
end
