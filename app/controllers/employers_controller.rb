class EmployersController < ApplicationController
  before_action :authenticate_employer

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

  private
  def authenticate_employer
    redirect_to(root_path) if current_user.nil? || current_user.type == 'Worker'
  end
end
