class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :name
      t.decimal :cost, precision: 8, scale: 2, null: true
    end
  end
end
