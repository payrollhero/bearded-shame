# This class trims beards
class BeardTrimmer

  def self.trim(user, length)
    user.beard_length = user.beard_length - length
    user.save
  end

	def self.shave(user)
    user.beard_length = 0
    user.shaved = true
    user.save
  end
end
