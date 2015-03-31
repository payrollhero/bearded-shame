class EmployersController < ApplicationController
  def index
    @workers = Worker.where.not(talent_id: nil)
  end

  def show

  end

  def hire
    current_user.hire_worker params[:worker_id]
    redirect_to :back
  end

  def unhire
    current_user.unhire_worker params[:worker_id]
    redirect_to :back
  end
end
