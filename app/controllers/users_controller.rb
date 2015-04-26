class UsersController < ApplicationController

  require 'beard_trimmer'
  require 'beard_trimmer/with_massage'
  def list
    @users = User.all
  end
  
  # This function return all users who have massaged
  def find_massage
    @users = User.where(:massaged => true)
    render 'list'
  end
  
  # This function return all users who have shaved
  def find_shave
    @users = User.where(:shaved => true)
    render 'list'
  end 

  # This function return all users who have trim
  # Initial beard length is init to 20. 
  # So if beard length is smaller than 20 and not 0. 
  # He must have trimmed
  def find_trim
    @users = User.where("beard_length < 20 AND beard_length != 0").where(:massaged => [false, nil])
    render 'list'
  end

  def trim
    @user = User.find(params[:id])
    BeardTrimmer.trim(@user, 10)
  end

  def massage_and_trim
  	@user = User.find(params[:id])
    BeardTrimmer::WithMassage.trim(@user, 10, "shiatsu")
  end

  def shave
    @user = User.find(params[:id])
    BeardTrimmer.shave(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.massaged = false
    @user.beard_length = 20
    @user.last_massage_type = nil
    if @user.save
      redirect_to action: "list"
    else
      render 'new'
    end
  end

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email)
  end    

  alias :index :list
end
