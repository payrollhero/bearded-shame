class UsersController < ApplicationController
  before_action :set_user

  def index
    @users = User.all
  end

  def trim
    if @user.has_beard?
      @user.trim
      render json: {status: "Trimmed"}
    else
      render json: {error: "Shaved at #{@user.updated_at}."}
    end
  end

  def shave
  end

  def massage_and_trim
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

end
