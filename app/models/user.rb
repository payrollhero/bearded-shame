class User < ActiveRecord::Base
  before_create :grow_beard

  def fullname
    first_name + " " + last_name
  end

  def trim
    self.status = "Trimmed"
  end

  def massage_and_trim
    self.status = "Massaged and Trimmed"
  end

  def shaved
    self.status = "Shaved"
  end

  def grow_beard
    self.status = "Unshaved beard"
  end

  def has_beard?
    if self.status == "Shaved"
      if((DateTime.now - self.updated_at) / 60 / 60) < 24
        return false
      end
    end
    return true
  end
end
