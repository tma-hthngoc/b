class Department < ActiveRecord::Base
  default_scope :order => 'name'
  has_many :projects
  attr_accessible :name

  def to_s
    self.name
  end
end
