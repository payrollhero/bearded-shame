class User < ActiveRecord::Base

  has_many :massages, inverse_of: :user

  def fullname
    first_name + " " + last_name
  end
end
