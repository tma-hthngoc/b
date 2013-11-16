class DropProjectCodeFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :project_code
  end

  def down
    add_column :projects, :project_code, :string
  end
end
