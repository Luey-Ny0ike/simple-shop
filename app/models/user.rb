class User < ApplicationRecord
  after_create :create_customer
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

  def make_admin
    user = self
    admin = Admin.find_by(email: user.email)
    if admin.present?
      admin.update(user_id: user.id)
    else
      Admin.create(email: user.email, user_id: user.id)
    end
  end

  def remove_admin
    admin = self.admin
    admin.destroy
  end
end
