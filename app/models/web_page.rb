class WebPage < ActiveRecord::Base

  attr_accessible :description, :page_html, :title

  validates :title, :uniqueness => true

  scope :sorted, order('title')

end
