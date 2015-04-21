# This class shave beards
class BeardShaver

  def self.shave(user)
    user.beard_length = 0
    user.shaved = true
    user.save
  end

end
