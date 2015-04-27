require 'rails_helper'

RSpec.describe UsersController, type: :controller do

let!(:user) {FactoryGirl.create :user}

  describe "POST#create" do
    before(:each) do
      post :create
    end

    it "adds one user to the database" do
      expect { user :create, user: Factory.attributes_for(:user)}.to change(User, :count).by(1)
    end
  end

end
