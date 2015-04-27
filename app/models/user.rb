class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include Nameable

  has_one :user_favorite_massage
  has_many :orders
  has_one :massage_type, through: :user_favorite_massage

  def self.last_massage_type=(id)
    self.user_favorite_massage = id
  end
end
