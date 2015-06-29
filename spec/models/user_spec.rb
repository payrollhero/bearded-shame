require 'rails_helper'

RSpec.describe User, type: :model do

  def create_user
    @user = User.create(first_name: "Jon", last_name: "Snow", email: "lordcommander@thewall.we")
  end

  describe "Create User" do
    it "creates a new user and leaves beard unshaved" do
      jon = User.new(first_name: "Jon", last_name: "Snow", email: "lordcommander@thewall.we")
      expect {jon.save}.to change{User.count}.by(1)
      expect(jon.status).to eq("Unshaved beard")
    end
  end

  describe "Groom User" do
    before(:all) do
      create_user
    end

    it "should trim the user's beard" do
      @user.trim
      expect(@user.status).to eq("Trimmed")
    end

    it "should shave the user's beard" do
      @user.shave
      expect(@user.status).to eq("Shaved")
    end

    it "should massage and trim user's beard" do
      @user.massage_and_trim
      expect(@user.status).to eq("Massaged and Trimmed")
    end
  end

end
