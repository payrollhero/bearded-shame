class Massage < Activity 

	before_save :set_duration, :set_vendor_name


	private 

	def set_duration 
		self.end_time = self.start_time + 1.hour
	end

	def set_vendor_name 
		self.vendor_name ||= "Happy Massage Pte Ltd"
	end

end