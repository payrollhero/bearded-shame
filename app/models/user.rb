class User < ActiveRecord::Base

  has_many :massages,    inverse_of: :user
  has_many :treatments,  inverse_of: :user
  has_one  :facial_hair, inverse_of: :user

  validates :first_name, :last_name, :email, presence: true
  validates_uniqueness_of :email

end
