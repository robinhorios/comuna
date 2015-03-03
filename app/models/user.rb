class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

	Roles = [
		User::Admin = "Admin",
		User::DistrictSupervisor = "Supervisor de Distrito",
		User::AreaSupervisor = "Supervisor de Área",
		User::Supervisor = "Supervisor",
		User::Leader = "Líder",
		User::Assist = "Auxiliar",
		User::AssistInTraining = "Auxiliar em Treinamento"
	]
	
	include ActiveModel::ForbiddenAttributesProtection

	belongs_to :spouse, :class_name => 'User', :foreign_key => 'spouse_id'
	belongs_to :state
	belongs_to :role
	has_and_belongs_to_many :cells
	has_and_belongs_to_many :events

	validates_presence_of :name, :email, message: "Deve ser preenchido", unless: :admin?
	validates_uniqueness_of :email
	validate :validate_presence_of_more_than_one_cell, unless: :admin?

	def admin?
		if self.admin == true
			true
		else
			false
		end	
	end

	def married?
		if self.spouse == nil
			false
		else
			true
		end	
	end

	def my_spose
		if self.spouse == nil
			"Solteiro"
		else
			self.spouse.name
		end
	end

	def role
		if self.admin == true
			User::Admin
		elsif self.district_supervisor == true
			User::DistrictSupervisor
		elsif self.area_supervisor
			User::AreaSupervisor
		elsif self.supervisor
			User::Supervisor
		elsif self.leader
			User::Leader
		elsif self.assist
			User::Assist
		elsif self.assist_in_training
			User::AssistInTraining
		elsif self.member
			User::Member
		elsif self.member_away
			User::MemberAway
		elsif self.visitor
			User::Visitor												
		end
	end

	private
	def validate_presence_of_more_than_one_cell
		errors.add("cells",
			"deve haver ao menos uma célula") if cells.empty?
	end
end

