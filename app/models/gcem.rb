class Gcem < ActiveRecord::Base

 
  
  has_many :user
  validates_associated :user
end
