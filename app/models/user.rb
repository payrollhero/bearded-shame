class User < ActiveRecord::Base
  validates :beard_length, :numericality => { :greater_than_or_equal_to => 0 }

  def fullname
    first_name + " " + last_name
  end

  def trimming(length)
    if validate_trim_length(length)
      BeardTrimmer.trim(self, length.to_i)
      true
    else
      false
    end
  end

  def massaging_and_trimming(length, type)
    if validate_trim_length(length)
      BeardTrimmer::WithMassage.trim(self, length.to_i,type)
      true
    else
      false
    end
  end

  def shaving
    self.beard_length = 0
    self.shaved = true
    self.save
  end

  def self.add_new
    User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, beard_length: Faker::Number.number(3), avatar_url: Faker::Avatar.image)
  end

  private

  def validate_trim_length(length)
    length =~ /^[0-9]+$/ && self.beard_length > length.to_i && length.to_i > 0
  end

end
