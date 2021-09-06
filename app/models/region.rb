class Region < ApplicationRecord
  has_many :products, dependent: :destroy

  # Validations
  validates_presence_of :title
  validates_presence_of :country_details
  validates_presence_of :currency_details
  validates_presence_of :tax_details
end
