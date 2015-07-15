class User < ActiveRecord::Base

  def needs_shave_or_trimming
    last_shaved_at >= 3 && ["shaved", "trimmed", "massaged_and_trimmed"].include?(status)
  end

  def last_shaved_at
    ((Time.now - updated_at) / 60 / 60 / 24).round(1).to_i
  end
end
