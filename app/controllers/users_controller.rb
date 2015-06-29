class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]
  before_action :prevent_rash_skin, except: [:index, :new, :create, :edit, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html {redirect_to users_path}
      else
        format.html {render :new}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def trim
    @user.trim
    render json: {status: @user.status}
  end

  def shave
    @user.shave
    render json: {status: @user.status}
  end

  def massage_and_trim
    @user.massage_and_trim
    render json: {status: @user.status}
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def prevent_rash_skin
    unless @user.has_beard?
      render json: {error: "User shaved #{last_groomed} ago. A beard take some time to grow before trimming / shaving again. Frequent razor contact may produce rash skin."}
    end
  end

  def last_groomed
    ActionController::Base.helpers.time_ago_in_words(@user.updated_at)
  end

end
