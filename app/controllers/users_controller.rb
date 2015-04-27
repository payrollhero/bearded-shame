
class UsersController < ApplicationController

  def list
    @users = User.all
  end

  def trim
    @user = User.find(params[:id])
  end

  def trimming
    @user = User.find(params[:id])
    @status = @user.trimming(params[:length])
  end

  def massage_and_trim
    @user = User.find(params[:id])
  end

  def massaging_and_trimming
    @user = User.find(params[:id])
    @status = @user.massaging_and_trimming(params[:length],params[:type])
  end

  def shave
    @user = User.find(params[:id])
  end

  def shaving
    @user = User.find(params[:id])
    @user.shaving
  end

  alias :index :list
end
