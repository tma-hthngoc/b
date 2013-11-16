class Activity < ActiveRecord::Base
  scope :sorted, :order => 'name'
  attr_accessible :description, :name, :closed
  
  validates :name, presence: true, uniqueness: true

  after_initialize do
    if self.new_record?
      self.closed ||= true
    end
  end  

  def to_s
    self.name
  end
end
