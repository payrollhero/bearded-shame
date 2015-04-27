require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do

let(:user) {User.create(:first_name => "Rebecca", :last_name => "Holzschuh", :email => "rebeccaholzschuh@gmail.com", :username=> "rebecca")}

  describe "POST#create" do
    it "adds one user to the database" do
      expect {user}.to change(User, :count).by(1)
    end
  end
end

#I ran out of time, but I would have liked to add more tests for each method!