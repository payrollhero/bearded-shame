class ChangePasswordTypeUser < ActiveRecord::Migration
  def change
    remove_column :users, :password
    add_column :users, :password, :varchar, null: false
  end
end
