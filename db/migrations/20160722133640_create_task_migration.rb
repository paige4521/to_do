class CreateTaskMigration < ActiveRecord::Migration
  def up
    create_table :tasks do |t|
      t.string :name
       
      t.boolean :complete
      t.timestamps :created_at
      t.integer :list_id
    end

  end
end
