class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :status, :string
    add_column :users, :groomed_at, :datetime
  end
end
