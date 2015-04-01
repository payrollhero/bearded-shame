class Activity < ActiveRecord::Base

	belongs_to :user

	#return string
	def duration
		total_seconds = self.end_time - self.start_time
		Time.at(total_seconds).utc.strftime("%H:%M:%S")		
	end
	
end
