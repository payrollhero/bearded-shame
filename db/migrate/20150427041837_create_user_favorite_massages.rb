class CreateUserFavoriteMassages < ActiveRecord::Migration
  def change
    create_table :user_favorite_massages do |t|
      t.references :user, index: true, foreign_key: true
      t.references :massage_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
