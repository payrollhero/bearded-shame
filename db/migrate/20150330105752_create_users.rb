class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      # removed email, username and password since we don't need it

      t.timestamps null: false
    end
  end
end
