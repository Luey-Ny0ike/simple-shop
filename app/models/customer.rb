class Customer < ApplicationRecord
  # Associations
  has_many :orders
  belongs_to :user, optional: true

  # Validations
  validates_uniqueness_of :email
end
