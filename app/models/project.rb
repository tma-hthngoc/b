class Project < ActiveRecord::Base

  has_many :status_reports
  has_one :risk_summary
  belongs_to :project_type
  belongs_to :sponsor
  belongs_to :pm, class_name: "Sponsor"
  belongs_to :activity
  belongs_to :department
  attr_accessible :name, :activity_id, :sponsor_id, :pm_id, :department_id, :project_type_id, :in_epm

  validates :name, uniqueness: true

  scope :sorted, joins(:department).order('departments.name, projects.name')
  scope :active,  joins(:activity).where(["activities.closed = ?", false])
  scope :inactive, joins(:activity).where(["activities.closed = ?", true])
  
  def in_epm?
    (self.in_epm && self.in_epm == 1) ? true : false
  end

  def self.epm_site
    EXTERNAL_EPM[:site]
  end

  def epm_url
    EXTERNAL_EPM[:project].call(self.name)
  end

  def to_s
    self.name
  end
end

