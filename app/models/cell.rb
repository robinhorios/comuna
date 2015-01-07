class Cell < ActiveRecord::Base

	validates :name, :address, :schedule, presence: true 

	has_and_belongs_to_many :users
end
