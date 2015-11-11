class CreateTrimType < ActiveRecord::Migration
  def change
    create_table :trim_types do |t|
      t.string :trim_type
      t.integer :length
      t.decimal :price
      t.timestamps
    end
  end
end
