class User < ActiveRecord::Base

	include ActiveModel::ForbiddenAttributesProtection

	belongs_to :role
	has_and_belongs_to_many :gcems
	has_and_belongs_to_many :events

	validates_presence_of :name, :email, message: "Deve ser preenchido"
	validates_numericality_of :phone
	validates_uniqueness_of :email

	validate :validate_presence_of_more_than_one_gcem

	private
	def validate_presence_of_more_than_one_gcem
		errors.add("gcems",
			"deve haver ao menos um gcem") if gcems.empty?
	end
end
