class EmployersController < ApplicationController
  def index
    @workers = Worker.all
  end
end
