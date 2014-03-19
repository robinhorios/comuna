module ApplicationHelper
	def get_gcem_name(id)
		gcem_user = GcemsUser.all.where(user_id: id).first.gcem.name
	end
end
