class CellsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@cells = Cell.all
	end

	def show
		@cell = Cell.find(params[:id])
	end

	def new
		@cell = Cell.new
	end

	def create
		@cell = Cell.new(cells_params)

		if @cell.save
			redirect_to(action: "show", id: @cell)
		else
			render "new"
		end
	end

	def edit
		@cell = Cell.find(params[:id])
	end

	def update
		@cell = current_user.cells.find(params[:id])

		if @cell.update_attributes(cells_params)
			redirect_to(action: "show", id: @cell)
		else
			render "new"
		end
	end

	def destroy
		@cell = Cell.find(params[:id])
    	@cell.destroy
    	redirect_to cells_path, id: @cell
	end


	private
	def cells_params
		params.require(:cell).permit(:name, :street, :schedule, :host, :week_day, :user_ids)
	end
end