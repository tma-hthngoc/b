class CreateReportPeriods < ActiveRecord::Migration
  def change
    create_table :report_periods do |t|
      t.date :week_ending

      t.timestamps
    end
  end
end
