class RolesController < ApplicationController
	def show
		@role = Role.find(params[:id])
	end

	def new
		@role = Role.new
	end

	def create
		@role = Role.new(role_params)
		if @role.save
			redirect_to(action: "show", id: @role)
		else
			render "new"
		end
	end

	def update
		
	end

	def destroy
		
	end

	private

	def role_params
      params.require(:role).permit(:name)
    end
end