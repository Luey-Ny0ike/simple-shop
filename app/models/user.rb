class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # Associations
  has_one :customer
  has_one :admin

  # CUSTOM METHODS
  def create_customer
    user = self
    customer = Customer.find_by(email: user.email)
    if customer.present?
      customer.update(user_id: user.id)
    else
      Customer.create(email: user.email, user_id: user.id)
    end
  end
end
