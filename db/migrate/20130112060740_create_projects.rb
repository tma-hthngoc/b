class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.references :sponsor
      t.string :project_code
      t.references :activity

      t.timestamps
    end
    add_index :projects, :sponsor_id
    add_index :projects, :activity_id
  end
end
