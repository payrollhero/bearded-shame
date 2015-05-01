class UsersController < ApplicationController

  def create
    @user  = User.create  params.require(:user)
                                .permit(:first_name, :last_name)
    @beard = Beard.create :user   => @user,  :status => 'unset'
  end

end
