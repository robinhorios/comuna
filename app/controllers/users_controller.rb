class UsersController < ApplicationController
	def index
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
		@cell = Cell.all
		@roles = Role.all
		@states = State.all
	end

	def create
		@user = User.new(user_params)
		@roles = Role.all
		@states = State.all
		
		if @user.save
			Signup.confirm_email(@user).deliver
			redirect_to(action: "show", id: @user)
		else
			render action: "new"
		end
	end

	def edit
		@user = User.find(params[:id])
		@roles = Role.all
		@states = State.all
		
	end

	def update
		params[:user][:cell_ids] ||= []
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to @user, notice: "Successfully created product."
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_url, notice: "Successfully destroyed user."
	end

	private

	def user_params
		params.require(:user).permit!
	end
end