class AddBeardLengthToUser < ActiveRecord::Migration
  def change
    add_column :users, :beard_length, :integer
  end
end
