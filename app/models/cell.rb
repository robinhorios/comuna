#encoding: utf-8

class Cell < ActiveRecord::Base

	validates :name, :street, :schedule, presence: true 

	belongs_to :state
	belongs_to :category
	has_and_belongs_to_many :users

	def members
		members = []
		
		self.users.each do |user|

		end
	end

	def members_by_role(role)
		members = []
		self.users.each do |user|
			if user.role == role
				members.push(user)
			end
		end

		if members.count > 1
			"#{members.first.name} e #{members.last.name}"
		elsif members.count == 1
			"#{members.first.name}"
		elsif members.count == 0
			"Esta célula ainda não tem #{role}"
		end
	end

	def total_members
		self.users.where.not(:district_supervisor => true).where.not(:area_supervisor => true).where.not(:supervisor => true).count
	end

	
end