class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  include Nameable

  has_one :user_favorite_massage
  has_many :orders
  has_one :massage_type, through: :user_favorite_massage

  def last_massage_type=(id)
    user_favorite_massage = id
  end

  def beard_length
    rand(0...100)
  end

  def beard_length=(size)
    # @TODO: send my current beard length to Twitter
  end
end
