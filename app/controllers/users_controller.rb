class UsersController < ApplicationController
  before_action :set_user, except: [:index]
  before_action :prevent_rash_skin, except: [:index]

  def index
    @users = User.all
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
