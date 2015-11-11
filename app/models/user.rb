class User < ActiveRecord::Base

  has_many :massages,    inverse_of: :user
  has_many :treatments,  inverse_of: :user
  has_one  :facial_hair, inverse_of: :user

  validates :first_name, :last_name, :email, presence: true
  validates_uniqueness_of :email

  def self.search(needle)
    needle = "%#{needle}%"
    users  = Arel::Table.new(:users)
    query  = users[:email].matches(needle)
         .or(users[:first_name].matches(needle)
         .or(users[:last_name].matches(needle)))
    where(query).order(users[:updated_at].desc)
  end

  def facial_hair(*args)
    super || build_facial_hair(*args)
  end

end
