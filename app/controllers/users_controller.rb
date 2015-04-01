class UsersController < ApplicationController

	before_filter :authenticate_user!

	before_action :set_user, only: [:trim, :shave, :massage_and_trim]

	def list
		@users = User.all
	end  
	alias :index :list

	def trim 

		beard_trim = BeardTrim.new({:start_time => Time.now, :user => @user})
		if beard_trim.save
			flash[:success] = "Trim is done!"
		else
			flash[:alert] = "Trim is NOT done!"
		end

		redirect_to root_path

	end

	def shave 

		shave = Shave.new({:start_time => Time.now, :user => @user})
		if shave.save
			flash[:success] = "Shave is done!"
		else
			flash[:alert] = "Shave is NOT done!"
		end

		redirect_to root_path

	end

	def massage_and_trim 

		begin 		
			Activity.transaction do 
				massage = Massage.create({:start_time => Time.now, :user => @user})

				BeardTrim.create({:start_time => massage.end_time, :user => @user})
			end
			flash[:success] = "Massage and Trim is done!"
		rescue Exception => e 
			logger.error("Error cause in massage and trim #{e.message} - #{e.backtrace} ")
			flash[:alert] = "Massage and Trim is NOT done!"
		end

		redirect_to root_path
	end	


	private
	def set_user
		begin
			@user = User.find(params[:id])
		rescue ActiveRecord::RecordNotFound => e
			flash[:alert] = "Unable to find user"
			logger.error("cannot find user at set_user #{e.message} - #{e.backtrace} ")
			redirect_to (request.referrer || root_path)
		end
	end
end
