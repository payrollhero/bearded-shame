class Employer < User
  has_many :workers

  def hire_worker(worker_id)
    worker = Worker.find worker_id
    worker.employer_id = id
    worker.save!
  end

  def unhire_worker(worker_id)
    worker = Worker.find worker_id
    worker.employer_id = nil
    worker.save
  end
end
