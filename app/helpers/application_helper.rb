module ApplicationHelper
	def get_cell_name(id)
		cell_user = CellsUsers.all.where(user_id: id).first.cell.name
	end
end
