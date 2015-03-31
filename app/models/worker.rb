class Worker < User
  belongs_to :talent
  belongs_to :employer

  def choose_talent(talent_id)
    update_attribute :talent_id, talent_id
  end
end
