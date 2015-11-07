# This class trims beards but also massages.
#
class BeardTrimmer::WithMassage < BeardTrimmer
  def self.trim(user, length, massage_type)
    user.beard_length = user.beard_length - length
    user.massaged = true
    user.last_massage_type = massage_type
    user.save
  end
end
