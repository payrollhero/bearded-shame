class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.references :user
      t.references :trim_type
      t.references :massage_type
      t.timestamps
    end
  end
end
