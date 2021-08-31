class Customer < ApplicationRecord
  # Associations
  has_many :orders

  # Validations
  validates_uniqueness_of :email
end
