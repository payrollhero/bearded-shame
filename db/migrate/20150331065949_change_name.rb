class ChangeName < ActiveRecord::Migration
  def change
    rename_column :users, :worker_id, :employer_id
  end
end
