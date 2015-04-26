class User < ActiveRecord::Base
  has_one :beard

  validates :first_name, presence: true
  validates :last_name,  presence: true

  def self.create_from_params(params)
    user = self.new
    user.first_name = params[:first_name]
    user.last_name  = params[:last_name]
    user.save

    user
  end

  def fullname
    first_name.to_s + " " + last_name.to_s
  end
end
