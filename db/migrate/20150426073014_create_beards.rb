class CreateBeards < ActiveRecord::Migration
  def change
    create_table :beards do |t|
      t.integer :user_id, null: false
      t.string  :status
      t.boolean :is_massaged
      t.timestamps null: false
    end
    add_index :beards, :user_id
  end
end
