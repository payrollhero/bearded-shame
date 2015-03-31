class EmployersController < ApplicationController
  def index
    @workers = Worker.where.not(talent_id: nil)
  end

  def show

  end

  def hire
    
  end
end
