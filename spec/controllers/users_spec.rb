require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "create" do
    # let(:user) {User.create(:first_name => "Rebecca", :last_name => "Holzschuh", :email => "rebeccaholzschuh@gmail.com", :username=> "rebecca")}
    # it "adds one user to the database" do
    #   expect {user}.to change(User, :count).by(1)
    # end

    # it "adds the user to the database" do
    #   User.create(:first_name => "Rebecca")
    #   expect(User.last.first_name).to eq("Rebecca")
    # end

    it "redirects back to the home page after saving a user" do
      post :create, user: {first_name: "Rebecca", last_name: "Holzschuh", username: "rebecca", password: "rebecca"}
      expect(response).to redirect_to root_path
    end

    context "when blank" do
      it "raises error when first name is blank" do
        user = User.new(last_name: "Holzschuh", username: "rebecca", password: "rebecca")
        expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
      end
      it "raises error when username is blank" do
        user = User.new(first_name: "Rebecca",last_name: "Holzschuh", password: "rebecca")
        expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
      end
      it "raises error when password is blank" do
        user = User.new(first_name: "Rebecca", last_name: "Holzschuh", username: "rebecca")
        expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

  end

  # before(:each) do
  #   @user = User.create(first_name: "Rebecca", last_name: "Holzschuh", username: "rebecca", password: "rebecca")
  # end

  let!(:user) {FactoryGirl.create :user}

  describe "index" do
    it "renders the page without error" do
      get :index
      expect(response).to be_ok
    end
  end

  describe 'trim' do
    it 'user starts at trimmed = false' do
      expect(user.trimmed).to be false
    end

    it 'trims a user' do
      expect {
        put :trim, id: user.id
        user.reload
      }.to change{user.trimmed}.from(false).to(true)
    end
  end

  describe 'massage_and_trim' do
    it 'user starts at massaged = false' do
      expect(user.massaged).to be false
    end

    it 'user starts at trimmed = false' do
      expect(user.trimmed).to be false
    end

    it 'massages a user' do
      expect {
        put :massage_and_trim, id: user.id
        user.reload
      }.to change{user.massaged}.from(false).to(true)
    end

    it 'trims a user' do
     expect {
        put :massage_and_trim, id: user.id
        user.reload
      }.to change{user.trimmed}.from(false).to(true)
    end
  end

  describe 'shave' do
    it 'user starts at shaved = false' do
      expect(user.shaved).to be false
    end

    it 'shaves a user' do
      expect {
        put :shave, id: user.id
        user.reload
      }.to change{user.shaved}.from(false).to(true)
    end
  end

  describe 'reset' do
    let!(:user) {User.create(first_name: "Rebecca", last_name: "Holzschuh", username: "rebecca", password: "rebecca", trimmed: true, massaged: true, shaved: true)}

    it 'user goes from massaged = true to massaged = false' do
      expect {
        put :reset, id: user.id
        user.reload
      }.to change{user.massaged}.from(true).to(false)
    end

    it 'user goes from trimmed = true to trimmed = false' do
      expect {
        put :reset, id: user.id
        user.reload
      }.to change{user.trimmed}.from(true).to(false)
    end

    it 'user goes from shaved = true to shaved = false' do
      expect {
        put :reset, id: user.id
        user.reload
      }.to change{user.shaved}.from(true).to(false)
    end

    it 'redirects to home page' do
      put :reset, id: user.id
      expect(response).to redirect_to root_path
    end
  end


end

