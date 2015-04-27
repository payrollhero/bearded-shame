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

  def trim
    user = User.find(params[:id])
    user.update_attribute(:trim, true)
    user.save
    render :json => user
  end

  def massage_and_trim
    user = User.find(params[:id])
    user.update_attributes(:trim => true, :massage => true)
    user.save
    render :json => user
  end

  def shave
    user = User.find(params[:id])
    user.update_attribute(:shave, true)
    user.save
    render :json => user
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
    end
end
