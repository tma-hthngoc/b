class User < ActiveRecord::Base
  default_scope order(:name)
  ROLES=[['Read Only', 'read-only'],
         ['Read Only - full menu', 'ro-full'],
         ['PM', 'pm'],
         ['Administrator','admin']]
  attr_accessible :email, :name, :password, :password_confirmation, :role
  has_secure_password
  validates_presence_of :password, :on => :create
  validates :name, 
    :uniqueness => true, 
    :format => { :with => /^[A-Za-z\d_]+$/, :message => "can only be alphanumeric with no spaces" }
 
end
