class AddMassagedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :massaged, :boolean
  end
end
