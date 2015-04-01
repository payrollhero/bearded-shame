class ActivitiesController < ApplicationController

	before_filter :authenticate_user!

	def index
		@user = User.includes(:activities).find(params[:user_id])
		@activities = @user.activities
	end

end
