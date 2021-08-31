class Order < ApplicationRecord
  # Associations
  belongs_to :customer
  has_many :order_items

  # custom methods
  def create_order_items
    # We will eventually process this using params from the associated cart
    # For now I just choose 2 products at random
    products = Product.limit(10).sample(2)
    products.each do |p|
      OrderItem.create(order_id: self.id, product_id: p.id)
    end
  end
end
