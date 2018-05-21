class CreateTagsMaps < ActiveRecord::Migration
  def change
    create_table :tags_maps do |t|
      t.references  :prototype
      t.references  :tag
      t.timestamps
    end
  end
end
