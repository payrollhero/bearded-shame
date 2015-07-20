require 'spec_helper'
require 'pry'
describe User do

  describe "needs_shave_or_trimming" do
    it "should be false when status is present & shaved_at date is less than 3 days old" do
      @user = User.create(first_name: "test", last_name: "user", email: Random.email, :gender => "male", :status => ["shaved", "trimmed", "massaged_and_trimmed", "unshaved"].sample, :shaved_at => DateTime.now)
      needs_shave_or_trimming = @user.needs_shave_or_trimming
      needs_shave_or_trimming.should be_falsy
    end
  end

  describe "male?" do
    it "should return true when user is male" do
      @user = User.create(first_name: "test", last_name: "user", email: Random.email, :gender => "female", :status => ["shaved", "trimmed", "massaged_and_trimmed", "unshaved"].sample, :shaved_at => DateTime.now)
      is_user_male = @user.male?
      is_user_male.should be_falsy
    end

    it "should return false when user is male" do
      @user = User.create(first_name: "test", last_name: "user", email: Random.email, :gender => "male", :status => ["shaved", "trimmed", "massaged_and_trimmed", "unshaved"].sample, :shaved_at => DateTime.now)
      is_user_male = @user.male?
      is_user_male.should be_truthy
    end
  end

  describe "has_beard?" do
    it "should return true when user has beard" do
      @user = User.create(first_name: "test", last_name: "user", email: Random.email, :gender => "female", :status => "unshaved", :shaved_at => DateTime.now)
      is_user_male = @user.has_beard?(@user.status)
      is_user_male.should be_truthy
    end

    it "should return false when user doesn't has beard" do
      @user = User.create(first_name: "test", last_name: "user", email: Random.email, :gender => "male", :status => "shaved", :shaved_at => DateTime.now)
      is_user_male = @user.has_beard?(@user.status)
      is_user_male.should be_falsy
    end
  end
  describe "full_name" do
    it "should return name containing both first_name & last name separated by space in title format" do
      @user = User.create(first_name: "test", last_name: "user", email: Random.email, :gender => ["male", "female"].sample, :status => ["shaved", "trimmed", "massaged_and_trimmed", "unshaved"].sample, :shaved_at => DateTime.now)
      full_name = @user.full_name
      full_name.should eq("Test User")
    end
  end

  context "An user object" do
    let!(:user) { User.new(:first_name=> "User", :last_name=> "User", :email => "user@example.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }
    
    it "respond to its attributes" do
      [:first_name, :last_name, :email, :gender, :status, :shaved_at].each do |attribute|
        expect(user).to respond_to(attribute)
      end
    end
  end

  context "when user object is initialized with first_name is not present" do
    let!(:user) { User.new(:first_name=> "", :last_name=> "User", :email => "user@example.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }
    
    it "should be invalid" do
      expect(user).to be_invalid
    end
  end

  context "when user object is initialized with first_name is too long" do
    let!(:user) { User.new(:first_name=> "a" * 251, :last_name=> "User", :email => "user@example.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }
    
    it "should be invalid" do
      expect(user).to be_invalid
    end
  end

  context "when user object is initialized with first_name is not too long" do
    let!(:user) { User.new(:first_name=> "a" * 249, :last_name=> "User", :email => "user@example.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }
    
    it "should be invalid" do
      expect(user).to be_valid
    end
  end

  context "when user object is initialized with first_name is present" do
    let!(:user) { User.new(:first_name=> "a", :last_name=> "User", :email => "user@example.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }
    
    it "should be valid" do
      expect(user).to be_valid
    end
  end

  context "when user object is initialized with last_name is not present" do
    let!(:user) { User.new(:first_name=> "a" * 21, :last_name=> "", :email => "user@example.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }
    
    it "should be invalid" do
      expect(user).to be_invalid
    end
  end

  context "when user object is initialized with last_name is too long" do
    let!(:user) { User.new(:last_name=> "a" * 251, :first_name=> "User", :email => "user@example.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }
    
    it "should be invalid" do
      expect(user).to be_invalid
    end
  end

  context "when user object is initialized with last_name is not too long" do
    let!(:user) { User.new(:last_name=> "a" * 250, :first_name=> "User", :email => "user@example.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }
    
    it "should be valid" do
      expect(user).to be_valid
    end
  end

  context "when user object is initialized with last_name is present" do
    let!(:user) { User.new(:last_name=> "a" * 250, :first_name=> "User", :email => "user@example.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }
    
    it "should be valid" do
      expect(user).to be_valid
    end
  end

  context "when user object is initialized with email is not present" do
    let!(:user) { User.new(:first_name=> "a" * 25, :last_name=> "User", :email => "", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }

    it "should be invalid" do
      expect(user).to be_invalid
    end
  end

  context "when email format is invalid" do
    invalid_email_formats = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com]
    let!(:user) { User.new(:first_name=> "a" * 25, :last_name=> "User", :email => invalid_email_formats.sample, :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }

    it "should be invalid" do
      expect(user).to be_invalid
    end
  end

  context "when email format is valid" do
    valid_email_formats = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    let!(:user) { User.new(:first_name=> "a" * 25, :last_name=> "User", :email => valid_email_formats.sample, :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }
    it "should be valid" do
      expect(user).to be_valid    
    end
  end

  context "when email address is already taken" do
    let!(:user) { User.create(:first_name=> "a" * 25, :last_name=> "User", :email => "testuser@gmail.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }
    let!(:user_with_same_email) { User.new(:first_name=> "a" * 25, :last_name=> "User", :email => "testuser@gmail.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }

    it "should be invalid" do
      expect(user_with_same_email).to be_invalid
    end
  end

  context "when email is present" do
    let!(:user) { User.new(:first_name=> "a" * 25, :last_name=> "User", :email => "testuser@gmail.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }

    it "should be valid" do
      expect(user).to be_valid
    end
  end

  context "when gender is not present" do
    let!(:user) { User.new(:first_name=> "a" * 25, :last_name=> "User", :email => "testuser@gmail.com", :gender => "", :status => "shaved", :shaved_at => DateTime.now) }

    it "should be invalid" do
      expect(user).to be_invalid
    end
  end

  context "when unpermitted gender value is present" do
    let!(:user) { User.new(:first_name=> "a" * 25, :last_name=> "User", :email => "testuser@gmail.com", :gender => "males", :status => "shaved", :shaved_at => DateTime.now) }

    it "should be invalid" do
      expect(user).to be_invalid
    end
  end

  context "when gender is present" do
    let!(:user) { User.new(:first_name=> "a" * 25, :last_name=> "User", :email => "testuser@gmail.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }

    it "should be valid" do
      expect(user).to be_valid
    end
  end

  context "when status is not present" do
    let!(:user) { User.new(:first_name=> "a" * 25, :last_name=> "User", :email => "testuser@gmail.com", :gender => "male", :status => "", :shaved_at => DateTime.now) }

    it "should be valid" do
      expect(user).to be_invalid
    end
  end

  context "when unpermitted status value is present" do
    let!(:user) { User.new(:first_name=> "a" * 25, :last_name=> "User", :email => "testuser@gmail.com", :gender => "male", :status => "shaven", :shaved_at => DateTime.now) }

    it "should be invalid" do
      expect(user).to be_invalid
    end
  end

  context "when status is present" do
    let!(:user) { User.new(:first_name=> "a" * 25, :last_name=> "User", :email => "testuser@gmail.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }

    it "should be valid" do
      expect(user).to be_valid
    end
  end

  context "when shaved_at value is present" do
    let!(:user) { User.new(:first_name=> "a" * 25, :last_name=> "User", :email => "testuser@gmail.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now) }

    it "should be valid" do
      expect(user).to be_valid
    end
  end

  context "when shaved_at is present" do
    let!(:user) { User.new(:first_name=> "a" * 25, :last_name=> "User", :email => "testuser@gmail.com", :gender => "male", :status => "shaved", :shaved_at => nil) }

    it "should be valid" do
      expect(user).to be_valid
    end
  end
end