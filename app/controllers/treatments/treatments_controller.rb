class Treatments::TreatmentsController < ApplicationController

  def create
    start_treatment
    respond_to do |format|
      if user.save
        format.html { redirect_to users_path, notice: "#{human_controller_name} created for #{user.decorate.full_name}"}
      else
        flash[:alert] = user.errors.full_messages
        format.html { render action: "new", status: :unprocessable_entity}
      end
    end
  end

  # @param ARR [User]
  # @param Array params
  # @return ARR [Trim]
  def start_treatment
    UserTreatment.new.call(user: user, type: trim_type)
  end

  protected

  def human_controller_name
    controller_name.humanize.singularize
  end

  def user
    @user ||= User.find(params[:user_id])
  end

  def treatment_type_params
    raise NotImplementedError "#{__method__} in #{controller_name}"
  end

  def trim_type
    TrimType.find(treatment_type_params[:trim_type_id])
  end

end
