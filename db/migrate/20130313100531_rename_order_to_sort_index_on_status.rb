class RenameOrderToSortIndexOnStatus < ActiveRecord::Migration
  def up
    rename_column :statuses, :order, :sort_index
  end

  def down
    rename_column :statuses, :sort_index, :order
  end
end
