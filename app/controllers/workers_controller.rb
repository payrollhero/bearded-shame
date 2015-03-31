class WorkersController < ApplicationController
  def index
    @talents = Talent.all
  end
end
