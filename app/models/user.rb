class User < ActiveRecord::Base
  validates :first_name, :username, :password, presence: true
  def fullname
    first_name + " " + last_name
  end
end


