class Beard < ActiveRecord::Base
  belongs_to :user

  STATUS = ['shaved', 'trimmed', 'unset']

  validates :status,  presence: true
  validates :user_id, presence: true

  validate :valid_status

  def update_status!(params)
    self.status = params[:status] if params[:status]
    self.save

    self.toggle_massaged! if params[:is_massaged]
  end

  def toggle_massaged!
    current_value = self.is_massaged
    self.is_massaged = !!!current_value
    self.save!
  end

  def massaged_label
    is_massaged? ? 'Has massaged' : 'Has not massaged'
  end

  private

  def valid_status
    unless STATUS.include?(self.status)
      self.errors.add(:status_undefined, 'beard status invalid')
    end
  end
end
