class UsersController < ApplicationController

  def show
    @users = User.all
  end
  alias :index :show

  def new
  end

  def create
    @user = User.create(user_params)
    redirect_to '/'
  end



  def trim
    user = User.find(params[:id])
    user.update_attribute(:trimmed, true)
    user.save
    render :json => user
  end

  def massage_and_trim
    user = User.find(params[:id])
    user.update_attributes(:trimmed => true, :massaged => true)
    user.save
    render :json => user
  end

  def shave
    user = User.find(params[:id])
    user.update_attribute(:shaved, true)
    user.save
    render :json => user
  end

  def reset
    user = User.find(params[:id])
    if user.trimmed == true && user.massaged = true
      user.update_attributes(:trimmed => false, :massaged => false)
    elsif user.trimmed == true
      user.update_attribute(:trimmed, false)
    elsif user.shaved == true
      user.update_attribute(:shaved, false)
    end
    user.save
    redirect_to '/'
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
    end
end
