class UsersController < ApplicationController

  def create
    @user  = User.create  params[:user]
    @beard = Beard.create :user   => @user,  :status => 'unset'
  end

end
