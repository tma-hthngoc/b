class AddDepartmentToProject < ActiveRecord::Migration
  def change
    add_column :projects, :department_id, :integer
  end
end
