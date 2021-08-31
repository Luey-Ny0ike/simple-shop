class Region < ApplicationRecord
  has_many :products, dependent: :destroy
end
