class AddRequiredFieldsToUsers < ActiveRecord::Migration
  def change
    # Add trimmed column that accepts boolean
    add_column :users, :trimmed, :boolean, :default => false
    # Add shaved column that accepts boolean
    add_column :users, :shaved, :boolean, :default => false
    # Add massaged column that accepts boolean
    add_column :users, :massaged, :boolean, :default => false
    # Add beard_length that accepts integer
    add_column :users, :beard_length, :integer, :default => 0
    # Add last_massage_type that accepts string
    add_column :users, :last_massage_type, :string
  end
end
