class Price < ActiveRecord::Base
  has_many :orders

  validates :name, presence: true, allow_blank: false
  validates :cost, presence: true, allow_blank: false
end
