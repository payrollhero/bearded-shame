
class UsersController < ApplicationController
  before_action :set_user , except: [:list, :create_user]

  def create_user
    User.add_new
    redirect_to action: :list
  end

  def list
    @users = User.all.order(id: :asc)
  end

  def trim
  end

  def trimming
    @status = @user.trimming(params[:length])
  end

  def massage_and_trim
  end

  def massaging_and_trimming
    @status = @user.massaging_and_trimming(params[:length], params[:type])
  end

  def shave
  end

  def shaving
    @user.shaving
  end

  alias :index :list

  private

  def set_user
    if params[:id].present?
      @user = User.find(params[:id])
    end
  end
end
