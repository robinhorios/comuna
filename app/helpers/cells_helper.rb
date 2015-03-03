module CellsHelper
  def belongs_to_cell(cell)
    user_signed_in? && cell.users.where(id: current_user.id).first == current_user
  end
end