class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :beard_length , :integer
    add_column :users, :massaged , :boolean , :default => false
    add_column :users, :last_massage_type , :string
  end
end
