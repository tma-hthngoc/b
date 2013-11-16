class Status < ActiveRecord::Base
  attr_accessible :icon_url, :name, :sort_index
  
  scope :sorted, order(:sort_index)
  
  def to_s
    self.name
  end
end
