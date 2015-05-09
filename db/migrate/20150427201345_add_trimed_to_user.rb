class AddTrimedToUser < ActiveRecord::Migration
  def change
    add_column :users, :trimed , :boolean , :default => false
  end
end
