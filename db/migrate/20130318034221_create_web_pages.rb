class CreateWebPages < ActiveRecord::Migration
  def change
    create_table :web_pages do |t|
      t.string :title
      t.string :description
      t.text :page_html

      t.timestamps
    end
  end
end
