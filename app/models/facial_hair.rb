class FacialHair < ActiveRecord::Base

  belongs_to :user, inverse_of: :facial_hair

end
