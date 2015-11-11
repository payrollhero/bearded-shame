class Treatment < ActiveRecord::Base

  belongs_to :user, inverse_of: :treatments, dependent: :destroy
  belongs_to :trim_type
  belongs_to :massage_type

  accepts_nested_attributes_for :trim_type
  accepts_nested_attributes_for :massage_type
  accepts_nested_attributes_for :user

end
