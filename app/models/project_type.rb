class ProjectType < ActiveRecord::Base
  has_many :projects
  attr_accessible :name
  
  scope :sorted, order(:name)

  def to_s
    self.name
  end
end
