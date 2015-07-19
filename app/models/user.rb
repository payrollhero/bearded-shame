class User < ActiveRecord::Base

  #----------------------Server Side Validations--------------------------------
  validates :first_name, :presence => true, :length => { :maximum => 250 }
  validates :last_name, :presence => true, :length => { :maximum => 250 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { :with => VALID_EMAIL_REGEX }, :uniqueness => {:case_sensitive => false}
  validates :gender, :presence => true, :inclusion => { in: %w(male female)}
  validates :status, :presence => true, :inclusion => { in: %w(shaved massaged_and_trimmed trimmed unshaved not_applicable)}
  validate :can_be_marked_unshaved
  validate :validate_shaving_need_based_on_gender
  validate :validate_needs_shave_or_trimming

  def custom_error_messages(validation_type)
    case validation_type
    when "can_be_marked_unshaved"
      errors.add(:base, "User can't be marked unshaved as he has shaved / trimmed #{ActionController::Base.helpers.time_ago_in_words(self.shaved_at)} ago.")
    when "gender_validation"
      errors.add(:base, "Female user can't be shaved / trimmed.")
    when "shaving_not_needed_validation"
      errors.add(:base, "User can't be shaved / trimmed again as he has shaved / trimmed #{ActionController::Base.helpers.time_ago_in_words(self.shaved_at)} ago.")
    end
  end

  def can_be_marked_unshaved
    if !self.needs_shave_or_trimming && has_beard?(status)
      custom_error_messages("can_be_marked_unshaved") if self.status_changed?
    end
  end

  def full_name
    (first_name + " " + last_name).titleize
  end

  def validate_needs_shave_or_trimming
    if !has_beard?(status_was) && !has_beard?(status) && self.status_changed?
      custom_error_messages("shaving_not_needed_validation") if !self.needs_shave_or_trimming
    else
      return true
    end
  end

  def validate_shaving_need_based_on_gender
    custom_error_messages("gender_validation") if !self.male? && status != "not_applicable"
  end

  def needs_shave_or_trimming
    if ["shaved", "massaged_and_trimmed", "trimmed" "unshaved"].include?(status) && self.male?
      if status_was.present? && last_shaved_at >= 3
        return true
      elsif status_was.present? && last_shaved_at <= 3
        return false
      else status_was.nil?
        return true
      end
    elsif status == "not_applicable" && !self.male?
      return true
    elsif status != "not_applicable" && !self.male?
      return false
    end
  end

  def male?
    gender == "male"
  end

  def has_beard?(status)
    status == "unshaved"
  end

  def last_shaved_at
    ((Time.now - shaved_at) / 60 / 60 / 24).round(1).to_i
  end
end
