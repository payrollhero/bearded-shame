class CreateMassage < ActiveRecord::Migration
  def change
    create_table :massages do |t|
      t.references :user
      t.string :type
      t.datetime :last_massage
      t.timestamps

      t.index [:user_id, :type ]
      t.index [:user_id, :last_massage ]
    end
  end
end
