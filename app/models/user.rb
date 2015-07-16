class User < ActiveRecord::Base

  validates :first_name, :presence => true, :length => { :maximum => 250 }
  validates :last_name, :presence => true, :length => { :maximum => 250 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { :with => VALID_EMAIL_REGEX }, :uniqueness => true
  validate :validate_shaving_need_based_on_gender
  validate :validate_needs_shave_or_trimming
  
  def full_name
    (first_name + " " + last_name).titleize
  end

  def validate_needs_shave_or_trimming
    if !self.needs_shave_or_trimming
      errors.add(:base, "User can't be shaved / trimmed again as he has shaved / trimmed #{ActionController::Base.helpers.time_ago_in_words(self.updated_at)} ago.") if self.status_changed?
    end
  end

  def validate_shaving_need_based_on_gender
    errors.add(:base, "Female user can't be shaved / trimmed.") if !self.male? 
  end

  def needs_shave_or_trimming
    if status_was.present? && last_shaved_at >= 3
      return true
    elsif status_was.present? && last_shaved_at <= 3
      return false
    else status_was.nil?
      return true
    end
  end

  def male?
    gender == "male"
  end

  def last_shaved_at
    ((Time.now - updated_at) / 60 / 60 / 24).round(1).to_i
  end
end
