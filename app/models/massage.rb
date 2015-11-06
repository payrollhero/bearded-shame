class Massage < ActiveRecord::Base

  belongs_to :user, inverse_of: :massages
  belongs_to :massage_type

end
