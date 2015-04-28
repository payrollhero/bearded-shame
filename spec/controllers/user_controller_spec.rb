require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do

let(:user) {User.create(:first_name => "Rebecca", :last_name => "Holzschuh", :email => "rebeccaholzschuh@gmail.com", :username=> "rebecca")}

  describe "POST#create" do
    it "adds one user to the database" do
      expect {user}.to change(User, :count).by(1)
    end
  end

  describe "GET#show" do
    it "renders show template" do
    end
    it "includes new user" do
      expect(response).to include()
    end
  end
end

