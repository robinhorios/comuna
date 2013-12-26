class Gcem < ActiveRecord::Base
	validates_presence_of :name, :address, :schedule, message: "Deve ser preenchido" 
 
  
  has_many :user
  validates_associated :user
end
