class UsersController < ApplicationController

  def list
    # Display list based on action_type param
    conditions = {}
    if params[:action_type] == 'trim'
      conditions[:trimmed] = true
    elsif params[:action_type] == 'massage_and_trim'
      conditions[:massaged] = true
      conditions[:trimmed] = true
    elsif params[:action_type] == 'shave'
      conditions[:shaved] = true
    end
    @users = User.where(conditions)
  end
  alias :index :list

  # Set trimmed to user
  # GET /users/:id/trim
  def trim
    if User.update_user(params[:id], 'trim')
      redirect_to root_url
    end
  end

  # Set massaged and trimmed to user
  # GET /users/:id/massage_and_trim
  def massage_and_trim
    if User.update_user(params[:id], 'massage_and_trim')
      redirect_to root_url
    end
  end

  # Set shaved to user
  # GET /users/:id/shave
  def shave
    if User.update_user(params[:id], 'shave')
      redirect_to root_url
    end
  end

end
