class UsersController < ApplicationController

  def list
    @users = User.all
  end
  alias :index :list

  def new
  end

  def create
    @user = User.create(user_params)
    redirect_to '/'
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
    end
end
