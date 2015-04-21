class User < ActiveRecord::Base
  require 'beard_trimmer'
  require 'beard_shaver'
  require 'beard_trimmer/with_massage'

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :beard_length, numericality: { greater_than: 0 }

  def fullname
    first_name + " " + last_name
  end

  # Update user for action that was chosen
  def self.update_user(id, action)
    @user = find(id)
    unless @user.blank?
      if action == 'trim'
        return BeardTrimmer.trim(@user, @user.beard_length)
      elsif action == 'massage_and_trim'
        return BeardTrimmer::WithMassage.trim(@user, @user.beard_length, 'massage_and_trim')
      elsif action == 'shave'
        return BeardShaver.shave(@user)
      end
    end
    return false
  end
end
