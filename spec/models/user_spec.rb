require 'spec_helper'

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

    before do
        @user = User.new(:first_name=> "User", :last_name=> "User", :email => "user@example.com", :gender => "male", :status => "shaved", :shaved_at => DateTime.now)
  	end

  	subject { @user }

  	it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
  	it { should respond_to(:email) }
  	it { should respond_to(:gender) }
    it { should respond_to(:status) }
    it { should respond_to(:shaved_at) }
    it { should be_valid }

    describe "when first_name is not present" do
        before { @user.first_name = " " }
        it { should_not be_valid }
    end

    describe "when first_name is too long" do
        before { @user.first_name = "a" * 251 }
        it { should_not be_valid }
    end

    describe "when first_name is not too long" do
        before { @user.first_name = "a" * 249 }
        it { should be_valid }
    end

    describe "when first_name is present" do
        before { @user.first_name = "a" * 249 }
        it { should be_valid }
    end

    describe "when last_name is not present" do
        before { @user.last_name = " " }
        it { should_not be_valid }
    end

    describe "when last_name is too long" do
        before { @user.last_name = "a" * 251 }
        it { should_not be_valid }
    end

    describe "when last_name is not too long" do
        before { @user.last_name = "a" * 249 }
        it { should be_valid }
    end

    describe "when last_name is present" do
        before { @user.last_name = "a" * 249 }
        it { should be_valid }
    end

    describe "when email is not present" do
      	before { @user.email = " " }
        it { should_not be_valid }
    end
        
    describe "when email format is invalid" do
        it "should be invalid" do
            addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                foo@bar_baz.com foo@bar+baz.com]
            addresses.each do |invalid_address|
               	@user.email = invalid_address
               	@user.should_not be_valid
            end      
        end
    end

    describe "when email format is valid" do
        it "should be valid" do
            addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
            addresses.each do |valid_address|
                @user.email = valid_address
                @user.should be_valid
            end      
        end
    end
        
    describe "when email address is already taken" do
        before do
            user_with_same_email = @user.dup
            user_with_same_email.email = @user.email.upcase
            user_with_same_email.save
        end

        it { should_not be_valid }
    end

    describe "when email is present" do
        before { @user.email = Random.email }
        it { should be_valid }
    end
        
    describe "when gender is not present" do
        before { @user.gender = " " }
        it { should_not be_valid }
    end

    describe "when unpermitted gender value is present" do
        before { @user.gender = "test" }
        it { should_not be_valid }
    end

    describe "when gender is present" do
        before { @user.gender = "male" }
        it { should be_valid }
    end

    describe "when status is not present" do
        before { @user.status = " " }
        it { should_not be_valid }
    end

    describe "when unpermitted status value is present" do
        before { @user.gender = "test" }
        it { should_not be_valid }
    end

    describe "when status is present" do
        before { @user.status = "shaved" }
        it { should be_valid }
    end

    describe "when shaved_at value is present" do
        before { @user.shaved_at = DateTime.now }
        it { should be_valid }
    end

    describe "when shaved_at is present" do
        before { @user.shaved_at = nil }
        it { should be_valid }
    end
end