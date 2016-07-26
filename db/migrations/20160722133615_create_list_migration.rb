class CreateListMigration < ActiveRecord::Migration
  def up
    create_table :lists do |t|
      t.string :name
      t.timestamps :created_at, null: false
    end 
  end

end
