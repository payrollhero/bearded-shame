class Beard < ActiveRecord::Base
  belongs_to :user

  STATUS = %w(shaved trimmed unset)

  validates :status,  presence: true,
                      inclusion: {in: STATUS, message: "beard status invalid"}
  validates :user_id, presence: true

  def update_status!(params)
    self.status = params[:status] if params[:status]

    if params[:is_massaged]
      massaged_value   = self.is_massaged
      self.is_massaged = !massaged_value
    end

    save
  end

end
