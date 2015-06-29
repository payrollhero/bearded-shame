class User < ActiveRecord::Base
  before_create :grow_beard

  def fullname
    first_name + " " + last_name
  end

  def trim
    self.status = "Trimmed"
    self.save
  end

  def massage_and_trim
    self.status = "Massaged and Trimmed"
    self.save
  end

  def shave
    self.status = "Shaved"
    self.save
  end

  def grow_beard
    self.status = "Unshaved beard"
  end

  def has_beard?
    if self.status == "Shaved"
      if((Time.now - self.updated_at) / 60 / 60) < 24
        return false
      end
    end
    return true
  end

end
