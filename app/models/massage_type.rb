class MassageType < ActiveRecord::Base
  has_many :orders
  has_many :user_favorite_massages
  has_many :users, through: :user_favorite_massages
end
