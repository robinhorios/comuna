class UsersController < ApplicationController
	def index
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to(action: "show", id: @user)
		else
			render action: "new"
		end
	end

	private

	def user_params
      params.require(:user).permit(:name, :email, :address, :phone, :operator, :date_of_birth, :gcem_id)
    end
end