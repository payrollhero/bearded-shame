FactoryGirl.define do

  	factory :activity, class: "Activity" do
  		start_time Time.now
  		end_time (Time.now + 3600)
  	end

  	factory :massage, parent: :activity, class: "Massage" do
  		start_time Time.now
  		vendor_name "Lai Lai Massage"
  	end

  	factory :shave, parent: :activity, class: "Shave" do
  		start_time Time.now
  		vendor_name "Mi So Smooth"
  	end

  	factory :beard_trim, parent: :activity, class: "BeardTrim" do
  		start_time Time.now
  		vendor_name "Spankly Clean"
  	end

end
