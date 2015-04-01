require 'rails_helper'

RSpec.describe Activity, type: :model do

	before(:each) do 
		@user = FactoryGirl.create(:user)
	end

	describe "Different Type" do 

		it "create Massage" do 
			Massage.create({:start_time => Time.now, :user => @user, :vendor_name => "Shop Test 1"})

			massage = Massage.all.first

			expect(massage.type).to eq("Massage")
			expect(massage.user_id).to eq(@user.id)
			expect(massage.vendor_name).to eq("Shop Test 1")
		end

		it "create shave" do 
			Shave.create({:start_time => Time.now, :user => @user, :vendor_name => "Shop Test 2"})

			shave = Shave.all.first

			expect(shave.type).to eq("Shave")
			expect(shave.user_id).to eq(@user.id)
			expect(shave.vendor_name).to eq("Shop Test 2")
		end

		it "create beard trim" do 
			BeardTrim.create({:start_time => Time.now, :user => @user, :vendor_name => "Shop Test 3"})

			beard_trim = BeardTrim.all.first

			expect(beard_trim.type).to eq("BeardTrim")
			expect(beard_trim.user_id).to eq(@user.id)
			expect(beard_trim.vendor_name).to eq("Shop Test 3")
		end		

	end

	describe "Different timing for each activities" do 

		it "Massage Time" do 
			massage = FactoryGirl.create(:massage, :user => @user)
			expect(massage.duration).to eq("01:00:00")
		end

		it "Shave Time" do 
			shave = FactoryGirl.create(:shave, :user => @user)
			expect(shave.duration).to eq("00:30:00")
		end

		it "Wax Time" do 
			beard_trim = FactoryGirl.create(:beard_trim, :user => @user)
			expect(beard_trim.duration).to eq("02:00:00")
		end		

	end

end
