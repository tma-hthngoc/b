class CreateStatusReports < ActiveRecord::Migration
  def change
    create_table :status_reports do |t|
      t.references :project
      t.text :highlight
      t.text :issues_risks
      t.text :next_steps
      t.text :remarks
      t.references :status
      t.references :report_period

      t.timestamps
    end
    add_index :status_reports, :project_id
    add_index :status_reports, :status_id
    add_index :status_reports, :report_period_id
  end
end
