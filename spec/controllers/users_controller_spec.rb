require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "Index" do
    it "responds with 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "should all users to @users" do
      jon, tyrion = User.create!, User.create!
      get :index

      expect(assigns(:users)).to match_array(User.all)
    end
  end

end
