class Sponsor < ActiveRecord::Base
  attr_accessible :initials, :name
  scope :sorted, order(:initials)
end
