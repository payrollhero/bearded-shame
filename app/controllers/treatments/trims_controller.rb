class Treatments::TrimsController < Treatments::TreatmentsController

  def new
    @user = user
    @treatment = @user.treatments.new
    @trim_types = TrimType.all
  end

  private

  def treatment_type_params
    params.require(:treatment).permit(:trim_type_id)
  end

end
