class AddMassageTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_massage_type, :string
  end
end
