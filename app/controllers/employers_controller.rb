class EmployersController < ApplicationController
  def index
    @workers = Worker.where.not(talent_id: nil)
  end
end
