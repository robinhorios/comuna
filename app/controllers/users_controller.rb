class UsersController < ApplicationController
	def index
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
		gcem_user = GcemsUser.where(user_id: @user.id).first
		gcem_user.nil? ? (@gcem = '') : (@gcem = gcem_user.gcem.name)
	end

	def new
		@user = User.new
		@gcems = Gcem.all
		@roles = Role.all
	end

	def create
		@user = User.new(user_params)
		
		if @user.save
			redirect_to(action: "show", id: @user)
		else
			render action: "new"
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(user_params)
			redirect_to(action: "show", id: @user)
		else
			render action: "new"
		end
	end

	def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path, id: @user
   end

	private

	def user_params
      params.require(:user).permit(:name, :email, :address, :phone, :operator, :date_of_birth, :gcem_ids, :role_id, :gcems)
    end
end