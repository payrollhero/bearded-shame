class UserFavoriteMassage < ActiveRecord::Base
  belongs_to :user
  belongs_to :massage_type

  validates :user_id, presence: true, allow_blank: false
  validates :massage_type_id, presence: true
end
