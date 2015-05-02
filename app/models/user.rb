class User < ActiveRecord::Base
  validates :beard_length, :numericality => { :greater_than_or_equal_to => 0 }

  def fullname
    first_name + " " + last_name
  end

  def validate_trim_length(length)
    length =~ /^[0-9]+$/ && self.beard_length > length.to_i && length.to_i > 0
  end

  def trimming(length)
    if validate_trim_length(length)
      BeardTrimmer.trim(self,length.to_i)
      "ok"
    else
      "fail"
    end
  end

  def massaging_and_trimming(length,type)
    if validate_trim_length(length)
      BeardTrimmer::WithMassage.trim(self,length.to_i,type)
      "ok"
    else
      "fail"
    end
  end

  def shaving
    BeardShaver.shave(self)
  end

  def self.add_new
    User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , beard_length: Faker::Number.number(3), avatar_url: Faker::Avatar.image)
  end
end
