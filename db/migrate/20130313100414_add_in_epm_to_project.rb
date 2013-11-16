class AddInEpmToProject < ActiveRecord::Migration
  def change
    add_column :projects, :in_epm, :integer
  end
end
