class UsersController < ApplicationController
  respond_to :html
  before_action :set_user, only: [:show, :edit, :update, :destroy, :trim, :massage_and_trim, :shave]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def create
    @user = User.new(user_params)
    respond_with @user do |format|
      if @user.save
        format.html {redirect_to user_path(@user), :notice => 'User was successfully created.'}
      else
        format.html {redirect_to new_user_path}
      end
    end
  end

  def update
    
    respond_with @user do |format|
      if @user.save
        format.html {redirect_to user_path(@user), :notice => 'User was successfully updated.'}
      else
        format.html {redirect_to edit_user_path(@user)}
      end
    end
  end

  def destroy
    @user.destroy
    respond_with @user do |format|
      format.html {redirect_to users_path, :notice => 'User was successfully destroyed.'}
    end
  end

  def trim
    if @user.update_attributes(:shaved_at => DateTime.now, :status => "trimmed")
      redirect_to users_url, :notice => "User got successfully shaved / trimmed."  
    else
      redirect_to users_url, :notice => @user.errors.to_a.join("<br />")  
    end
  end

  def massage_and_trim
    if @user.update_attributes(:shaved_at => DateTime.now, :status => "massaged_and_trimmed")
      redirect_to users_url, :notice => "User got successfully shaved / trimmed."  
    else
      redirect_to users_url, :notice => @user.errors.to_a.join("<br />")  
    end
  end

  def shave
    if @user.update_attributes(:shaved_at => DateTime.now, :status => "shaved")
      redirect_to users_url, :notice => "User got successfully shaved / trimmed."  
    else
      redirect_to users_url, :notice => @user.errors.to_a.join("<br />")  
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user][:shaved_at] = DateTime.now  
      params.require(:user).permit(:first_name, :last_name, :email, :gender, :status, :shaved_at)
    end
end
