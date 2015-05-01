class User < ActiveRecord::Base
  has_one :beard

  validates :first_name, presence: true
  validates :last_name,  presence: true

  def fullname
    "#{first_name} #{last_name}"
  end
end
