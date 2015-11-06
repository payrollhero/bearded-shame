class CreateFacialHair < ActiveRecord::Migration
  def change
    create_table :facial_hair do |t|
      t.references :user
      t.integer :hair_length
      t.datetime :last_trimmed
      t.timestamps

      t.index [:user_id, :last_trimmed]
    end
  end
end
