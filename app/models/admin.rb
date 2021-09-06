class Admin < ApplicationRecord
  # Associations
  belongs_to :user

  # Validations
  validates_presence_of :email
end
