class StatusReport < ActiveRecord::Base
  belongs_to :project
  belongs_to :status
  belongs_to :report_period
  attr_accessible :highlight, :issues_risks, :next_steps, :remarks, 
  :report_period_id, :status_id, :project_id

  scope :normal, joins(:report_period).order("report_periods.week_ending ASC")
  scope :reversed, joins(:report_period).order("report_periods.week_ending DESC")

end
