require 'spec_helper'
require "rails_helper"

RSpec.describe UsersController, type: :controller do  
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the users into @users" do
      User.delete_all
      user1 = User.create(first_name: Random.firstname, last_name: Random.lastname, email: Random.email, :gender => "male", :status => "shaved", :shaved_at => DateTime.now)
      get :index

      expect(assigns(:users)).to match_array([user1])
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      User.delete_all
      user1 = User.create(first_name: Random.firstname, last_name: Random.lastname, email: Random.email, :gender => "male", :status => "shaved", :shaved_at => DateTime.now)
      get :show, :id => user1.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      User.delete_all
      user1 = User.create(first_name: Random.firstname, last_name: Random.lastname, email: Random.email, :gender => "male", :status => "shaved", :shaved_at => DateTime.now)
      get :show, :id => user1.id
      expect(response).to render_template("show")
    end
    
    it "should assign the respective users to @user" do
      User.delete_all
      user1 = User.create(first_name: Random.firstname, last_name: Random.lastname, email: Random.email, :gender => "male", :status => "shaved", :shaved_at => DateTime.now)
      
      get :show, id: user1.id
      expect(assigns(:user)).to match(user1)
    end
  end

  describe "GET #edit" do
    it "responds successfully with an HTTP 200 status code" do
      User.delete_all
      user1 = User.create(first_name: Random.firstname, last_name: Random.lastname, email: Random.email, :gender => "male", :status => "shaved", :shaved_at => DateTime.now)
      get :edit, :id => user1.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the edit template" do
      User.delete_all
      user1 = User.create(first_name: Random.firstname, last_name: Random.lastname, email: Random.email, :gender => "male", :status => "shaved", :shaved_at => DateTime.now)
      get :edit, :id => user1.id
      expect(response).to render_template("edit")
    end
    
    it "should assign the respective users to @user" do
      User.delete_all
      user1 = User.create(first_name: Random.firstname, last_name: Random.lastname, email: Random.email, :gender => "male", :status => "shaved", :shaved_at => DateTime.now)
      
      get :edit, id: user1.id
      expect(assigns(:user)).to match(user1)
    end
  end

  describe "POST #create" do

    it "redirects to the new user" do
      User.delete_all
      user_params = {first_name: Random.firstname, last_name: Random.lastname, email: Random.email, :gender => "male", :status => "shaved", :shaved_at => DateTime.now}
      post :create, :user => user_params
      response.should redirect_to User.last
    end
    
    it "creates a new user with valid data entered in the form" do
      User.delete_all
      user_params = {first_name: Random.firstname, last_name: Random.lastname, email: Random.email, :gender => "male", :status => "shaved", :shaved_at => DateTime.now}
      
      expect{ post :create, :user => user_params }.to change(User,:count).by(1)
    end

    it "doesn't creates a new user with valid data entered in the form" do
      User.delete_all
      user_params = {first_name: " ", last_name: Random.lastname, email: Random.email, :gender => "male", :status => "shaved", :shaved_at => DateTime.now}
      
      expect{ post :create, :user => user_params }.to_not change(User,:count)
    end
  end

  describe "POST #update" do

    it "redirects to the updated user" do
      User.delete_all
      user1 = User.create(first_name: Random.firstname, last_name: Random.lastname, email: Random.email, :gender => "male", :status => "shaved", :shaved_at => DateTime.now)
      user_params = {first_name: "Test"}
      put :update, :id => user1.id, :user => user_params
      response.should redirect_to User.last
    end

    it "updates a new user with invalid data entered in the form" do
      User.delete_all
      user1 = User.create(first_name: Random.firstname, last_name: Random.lastname, email: Random.email, :gender => "male", :status => "shaved", :shaved_at => DateTime.now)
      user_params = {first_name: "Test"}
      put :update, :id => user1.id, :user => user_params
      expect(assigns(:user).first_name).to_not eq("Test")
    end
  end
end
