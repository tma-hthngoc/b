class ReportPeriod < ActiveRecord::Base
  attr_accessible :week_ending
  default_scope :order => "week_ending ASC"

  def self.next(date)
    ReportPeriod.first :conditions => ["week_ending > ?", date]
  end

  def self.this_week
    ReportPeriod.first :conditions => ["week_ending >= ?", Date.today]
  end

  def self.last_week
    ReportPeriod.unscoped.first :conditions => ["week_ending < ?", Date.today], :order => "week_ending DESC"
  end

  def to_s
    self.week_ending.strftime '%Y-%m-%d, %a'
  end
end
