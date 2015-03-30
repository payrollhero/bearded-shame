class UsersController < ApplicationController

  def list
    @users = User.all
  end
  alias :index :list
end
