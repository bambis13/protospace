class AddDefaultToPrototype < ActiveRecord::Migration
  def change
    change_column_null :prototypes, :likes_count ,false
  end
end
