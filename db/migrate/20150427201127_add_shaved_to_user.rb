class AddShavedToUser < ActiveRecord::Migration
  def change
    add_column :users, :shaved , :boolean , :default => false
  end
end
