class AddClosedToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :closed, :boolean
  end
end
