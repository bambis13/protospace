class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user
      t.references :prototype
      t.timestamps null: false
    end
  end
end
