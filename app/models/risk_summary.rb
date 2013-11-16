class RiskSummary < ActiveRecord::Base
  
  belongs_to :project
  attr_accessible :riskfile, :project_id
  has_attached_file :riskfile
  validates :project_id, :uniqueness => true

  validates_attachment :riskfile, presence: true, 
  content_type: {content_type: 
    ['application/pdf', 
     'application/vnd.xls',
     'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet']},
    size: {in: 0..1000.kilobytes}

  scope :sorted, includes(:project).order('projects.name')
  
end
