# This class trims beards
module BeardTrimmer

  def self.trim(user, length)
    user.beard_length = user.beard_length - length
    user.save
  end

end
