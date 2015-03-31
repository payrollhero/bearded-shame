class WorkersController < ApplicationController
  before_action :authenticate_worker

  def index
    @talents = Talent.where.not(id: current_user.talent_id)
  end

  def choose_talent
    current_user.choose_talent params[:talent_id]
    # worker = Worker.find params[:id]
    # worker.update_attribute :talent_id, params[:talent_id]
    redirect_to :back
  end

  private
  def authenticate_worker
    redirect_to(root_path) if current_user.nil? || current_user.type == 'Employer'
  end
end
