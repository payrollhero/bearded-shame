class WorkersController < ApplicationController
  def index
    @talents = Talent.where.not(id: current_user.talent_id)
  end

  def choose_talent
    worker = Worker.find params[:id]
    worker.update_attribute :talent_id, params[:talent_id]
    redirect_to :back
  end
end
