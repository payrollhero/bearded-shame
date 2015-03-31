class AddTalentIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :talent_id, :integer
  end
end
