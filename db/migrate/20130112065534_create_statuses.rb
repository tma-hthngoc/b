class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :icon_url
      t.integer :order

      t.timestamps
    end
  end
end
