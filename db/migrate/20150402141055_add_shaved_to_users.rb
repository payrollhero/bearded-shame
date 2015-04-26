class AddShavedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shaved, :boolean
  end
end
