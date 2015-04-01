class CreateActivities < ActiveRecord::Migration
  	def change
    	create_table :activities do |t|
    		t.string :type
	    	t.datetime :start_time
	    	t.datetime :end_time
	    	t.integer :user_id
	    	t.string :vendor_name
	    	t.timestamps
    	end

	    add_index :activities, [:id, :type]
	    add_index :activities, :user_id
  	end
end
