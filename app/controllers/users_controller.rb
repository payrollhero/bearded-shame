class UsersController < ApplicationController

  before_action :find_user

  skip_before_action :find_user, only: [:index, :create]

  after_action :save_user

  skip_after_action :save_user, only: [:index, :show, :new]

  after_action :render_json, only: [:trim, :massage_and_trim, :shave]

  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
    user = User.create(user_params)
    # redirect_to root_path, alert: "You have successfully signed up!"
  end

  def trim
    @user.update_attribute :trimmed, true
  end

  def massage_and_trim
    @user.update_attributes trimmed: true, massaged: true
  end

  def shave
    @user.update_attribute :shaved, true
  end

  def reset
    @user.update_attributes trimmed: false, massaged: false, shaved: false
    # redirect_to root_path, notice: "You are reset!"
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def save_user
    @user.save!
  end

  def render_json
    render :json => @user
  end
end
