class UsersController < ApplicationController

  def create
    @user  = User.create_from_params(params[:user])
    @beard = Beard.create(:user_id => @user.id,
                          :status => 'unset')
  end

end
