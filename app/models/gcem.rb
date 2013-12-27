class Gcem < ActiveRecord::Base
	validates_presence_of :name, :address, :schedule, message: "Deve ser preenchido" 
 
 	has_and_belongs_to_many :users
end
