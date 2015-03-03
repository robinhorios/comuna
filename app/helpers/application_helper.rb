module ApplicationHelper
	def get_cell_name(id)
		cell_user = CellsUsers.all.where(user_id: id).first.cell.name
	end

	def my_users
		users = []
		if current_user.role == User::Leader
			not_included = [User::Admin,User::DistrictSupervisor,User::AreaSupervisor, User::Supervisor]
		elsif current_user.role == User::Supervisor
			not_included = [User::Admin,User::DistrictSupervisor,User::AreaSupervisor]
		elsif current_user.role == User::AreaSupervisor
			not_included = [User::Admin,User::DistrictSupervisor]
		elsif current_user.role == User::DistrictSupervisor
			not_included = [User::Admin]
		elsif current_user.role == User::Admin
			not_included = []
		end
			
		current_user.cells.each do |cell|
			cell.users.each do |user|
				users.push(user) unless not_included.include?(user.role) or users.include?(user) 
			end
		end
		users
	end

	# def my_users
	# 	users = []
	# 	current_user.cells.each do |cell|
	# 		cell.users.each_with_index do |user, index|
	# 			if current_user.role == User::Leader
	# 				not_included = [User::Admin,User::DistrictSupervisor,User::AreaSupervisor]
	# 				users.push(user) unless not_included.include?(User::Leader) or users.include?(user)
	# 			elsif current_user.role == User::Assist
	# 				not_included = [User::Admin,User::DistrictSupervisor,User::AreaSupervisor, User::Leader]
	# 				users.push(user) unless not_included.include?(User::Supervisor) or users.include?(user)
	# 			elsif current_user.role == User::Supervisor
	# 				not_included = [User::Admin,User::DistrictSupervisor,User::AreaSupervisor]
	# 				users.push(user) unless not_included.include?(User::Supervisor) or users.include?(user)
	# 			elsif current_user.role == User::AreaSupervisor
	# 				not_included = [User::Admin,User::DistrictSupervisor]
	# 				users.push(user) unless not_included.include?(User::AreaSupervisor) or users.include?(user)
	# 			elsif current_user.role == User::DistrictSupervisor
	# 				not_included = [User::Admin]
	# 				users.push(user) unless not_included.include?(User::DistrictSupervisor) or users.include?(user)
	# 			elsif current_user.role == User::Admin
	# 				not_included = [""]
	# 				users.push(user) unless not_included.include?(User::Admin) or users.include?(user)
	# 			end
	# 		end
	# 	end
	# 	users
	# end

	def my_roles
		roles = []
		if current_user.leader == true 
			not_included = [User::Admin,User::DistrictSupervisor,User::AreaSupervisor, User::Supervisor]
			roles.push(User::Leader) unless not_included.include?(User::Leader)
		elsif current_user.supervisor == true
			not_included = [User::Admin,User::DistrictSupervisor,User::AreaSupervisor]
			roles.push(User::Supervisor) unless not_included.include?(User::Supervisor)
		elsif current_user.area_supervisor == true
			not_included = [User::Admin,User::DistrictSupervisor]
			roles.push(User::AreaSupervisor) unless not_included.include?(User::AreaSupervisor)
		elsif current_user.district_supervisor == true
			not_included = [User::Admin]
			roles.push(User::DistrictSupervisor) unless not_included.include?(User::DistrictSupervisor)
		elsif current_user.admin == true
			not_included = [""]
			roles.push(User::Admin) unless not_included.include?(User::Admin)
		end
		roles
	end

	def error_tag(model, attribute)
		if model.errors.has_key? attribute
			content_tag(
				:div,
				model.errors[attribute].first,
				class: 'error_message'
					)
		end
	end
end



