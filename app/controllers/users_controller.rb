class UsersController < ApplicationController

  def index
    @users = User.all.decorate
  end
end
