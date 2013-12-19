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

		if user.save
			redirect_to(action: "show", id: @user)
		else
			render action: "new"
		end
	end

	def user_params
      params.require(:user).permit(:address, :gcem_id, :date_of_birth, :email, :name, :operator, :phone)
    end
end