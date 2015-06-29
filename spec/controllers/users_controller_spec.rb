require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  def create_user
    @user = User.create(first_name: "Jon", last_name: "Snow", email: "lordcommander@thewall.we")
  end

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

  describe "Show" do
    before(:all) do
      create_user
    end

    it "responds with 200 status code" do
      get :show, id: @user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders show template" do
      get :show, id: @user.id
      expect(response).to render_template("show")
    end

    it "should assign the respective users to @user" do
      get :show, id: @user.id

      expect(assigns(:user)).to match(@user)
    end
  end

  describe "Edit" do
    before(:all) do
      create_user
    end

    it "responds with 200 status code" do
      get :show, id: @user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders show template" do
      get :show, id: @user.id
      expect(response).to render_template("show")
    end

    it "should assign the respective users to @user" do
      get :show, id: @user.id
      expect(assigns(:user)).to match(@user)
    end
  end

  describe "Groom User" do
    before(:all) do
      create_user
    end

    it "should trim the user when unshaved or trimmed" do
      post :trim, id: @user.id
      expect(response.body).to match({:status => "Trimmed"}.to_json)
    end

    it "should shave the user when unshaved or trimmed" do
      post :shave, id: @user.id
      expect(response.body).to match({:status => "Shaved"}.to_json)
    end

    it "should massage and trim the user when unshaved or trimmed" do
      post :massage_and_trim, id: @user.id
      expect(response.body).to match({:status => "Massaged and Trimmed"}.to_json)
    end

    it "should not trim the user when shaved within last 24 hrs" do
      post :shave, id: @user.id
      post :trim, id: @user.id
      expect(response.body).not_to match({:status => "Trimmed"}.to_json)
    end

    it "should not shave the user when shaved within last 24 hrs" do
      post :shave, id: @user.id
      post :shave, id: @user.id
      expect(response.body).not_to match({:status => "Shaved"}.to_json)
    end

    it "should not massage and trim the user when shaved within last 24 hrs" do
      post :shave, id: @user.id
      post :massage_and_trim, id: @user.id
      expect(response.body).not_to match({:status => "Massaged and Trimmed"}.to_json)
    end

  end

end
