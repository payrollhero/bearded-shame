class AddShavedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shaved_at, :datetime
  end
end
