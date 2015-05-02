class AddTrimMassageShaveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :trimmed, :boolean, default: false
    add_column :users, :massaged, :boolean, default: false
    add_column :users, :shaved, :boolean, default: false
  end
end
