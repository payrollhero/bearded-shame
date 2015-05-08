class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :massage_type
  belongs_to :price

  validates :user_id, presence: true, allow_blank: false
  validates :massage_type_id, presence: true, allow_blank: false
  validates :shave_id, presence: true, allow_blank: false
  validates :cost, presence: true, allow_blank: false

end
