class BeardsController < ApplicationController
  def index
    @users = Fetcher.fetch_user_beards
  end

  def update
    @beard = Beard.find(params[:id])
    @beard.update_status!(params)
  end

end

