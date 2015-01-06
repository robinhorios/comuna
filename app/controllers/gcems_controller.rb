class GcemsController < ApplicationController

	def index
		@gcem = Gcem.all
	end

	def show
		@gcem = Gcem.find(params[:id])
	end

	def new
		@gcem = Gcem.new
	end

	def create
		@gcem = Gcem.new(gcems_params)

		if @gcem.save
			redirect_to(action: "show", id: @gcem)
		else
			render "new"
		end
	end

	def edit
		@gcem = Gcem.find(params[:id])
	end

	def update
		@gcem = Gcem.new(params[:id])

		if @gcem.update_attributes(gcems_params)
			redirect_to(action: "show", id: @gcem)
		else
			render "new"
		end
	end

	def destroy
		@gcem = Gcem.find(params[:id])
    @gcem.destroy
    redirect_to gcems_path, id: @gcem
	end


	private
	def gcems_params
		params.require(:gcem).permit(:name, :address, :schedule, :host, :week_day, :user_ids)
	end
end