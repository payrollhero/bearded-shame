class CreateMassageType < ActiveRecord::Migration
  def change
    create_table :massage_types do |t|
      t.string :massage_type
      t.string :length
      t.decimal :price
      t.timestamps
    end
  end
end
