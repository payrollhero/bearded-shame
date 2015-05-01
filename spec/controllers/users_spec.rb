require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "create" do
    # let(:user) {User.create(:first_name => "Rebecca", :last_name => "Holzschuh", :email => "rebeccaholzschuh@gmail.com", :username=> "rebecca")}
    # it "adds one user to the database" do
    #   expect {user}.to change(User, :count).by(1)
    # end

    it "adds the user to the database" do
      User.create(:first_name => "Rebecca")
      expect(User.last.first_name).to eq("Rebecca")
    end

    it "redirects back to the home page after saving a user" do
      post :create, user: {:first_name => "Rebecca", :last_name => "Holzschuh"
      expect(response).to redirect_to root_path
    end
  end

  before(:each) do
    @user = User.create(:first_name => "Rebecca", :last_name => "Holzschuh", :email => "rebeccaholzschuh@gmail.com", :username=> "rebecca")
  end

  describe "show" do
    subject {get :show}
    it "renders show template" do
      expect(subject).to render_template(:show)
    end
  end

  describe 'trim' do
    it 'user starts at trimmed = false' do
      expect(@user.trimmed).to be false
    end

    it 'trims a user' do
      put :trim, :id => @user.id
      @user.reload
      expect(@user.trimmed).to be true
    end
  end

  describe 'massage_and_trim' do
    it 'user starts at massaged = false' do
      expect(@user.massaged).to be false
    end
    it 'user starts at trimmed = false' do
      expect(@user.trimmed).to be false
    end
    it 'massages a user' do
      put :massage_and_trim, :id => @user.id
      @user.reload
      expect(@user.massaged).to be true
    end
    it 'trims a user' do
      put :massage_and_trim, :id => @user.id
      @user.reload
      expect(@user.trimmed).to be true
    end
  end

  describe 'shave' do
    it 'user starts at shaved = false' do
      expect(@user.shaved).to be false
    end
    it 'shaves a user' do
      put :shave, :id => @user.id
      @user.reload
      expect(@user.shaved).to be true
    end
  end

  describe 'reset' do

    it 'user goes from massaged and trimmed = true to massaged and trimmed = false' do
      put :massage_and_trim, :id => @user.id
      @user.reload
      put :reset, :id => @user.id
      @user.reload
      expect(@user.massaged).to be false
    end

    it 'user goes from massaged and trimmed = true to massaged and trimmed = false' do
      put :massage_and_trim, :id => @user.id
      @user.reload
      put :reset, :id => @user.id
      @user.reload
      expect(@user.trimmed).to be false
    end

    it 'user goes from trimmed = true to trimmed = false' do
      put :trim, :id => @user.id
      @user.reload
      put :reset, :id => @user.id
      @user.reload
      expect(@user.trimmed).to be false
    end

    it 'user goes from shaved = true to shaved = false' do
      put :shave, :id => @user.id
      @user.reload
      put :reset, :id => @user.id
      @user.reload
      expect(@user.shaved).to be false
    end

    it 'does not change user#massaged if user is only massaged' do
      @user.update_attribute(:massaged, true)
      put :reset, :id => @user.id
      expect(@user.massaged).to be true
    end

    it 'does not change user#massaged if user is only trimmed' do
    put :massage_and_trim, :id => @user.id
    @user.reload
    put :reset, :id => @user.id
    expect(@user.massaged).to be true
    end

    it 'redirects to home page' do
      put :massage_and_trim, :id => @user.id
    @user.reload
    put :reset, :id => @user.id
    expect(response).to redirect_to root_path
    end
  end

end

