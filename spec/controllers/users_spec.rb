require 'rails_helper'

RSpec.describe UsersController, type: :controller do

let(:user) {User.create(:first_name => "Rebecca", :last_name => "Holzschuh", :email => "rebeccaholzschuh@gmail.com", :username=> "rebecca")}

  describe "create" do
    it "adds one user to the database" do
      expect {user}.to change(User, :count).by(1)
    end

    it "adds the user to the database" do
      expect(User.last.first_name).to eq("Rebecca")
    end
  end

  describe "GET#show" do
    subject {get :show}
    it "renders show template" do
      expect(subject).to render_template(:show)
    end
  end
end

