class UsersController < ApplicationController

  def index
    @users = User.all.decorate
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params).decorate

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: "#{@user.full_name} created"}
      else
        flash[:alert] = @user.errors.full_messages
        format.html { render action: "new", status: :unprocessable_entity}
      end
    end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
