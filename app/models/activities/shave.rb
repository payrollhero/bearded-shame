class Shave < Activity 

	before_save :set_duration, :set_vendor_name


	private 

	def set_duration 
		self.end_time = self.start_time + 30.minute
	end

	def set_vendor_name 
		self.vendor_name ||= "Mi So Smooth"
	end

end