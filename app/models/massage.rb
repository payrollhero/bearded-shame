class Massage < ActiveRecord::Base

  belongs_to :user, inverse_of: :massages

end
