class UsersController < ApplicationController
	before_action :authenticate_user!
	after_action :confirmation_email, only: [:update]

	def index
		# @user = view_context.my_users
		@user = User.all
		@cells = current_user.cells
	end

	def show
		@user = User.find(params[:id])
		@cell = current_user.cells
	end

	def new
		@user = User.new
		@users = User.where.not(admin: true)
		@cell = Cell.all
		@roles = view_context.my_roles
		@states = State.all
	end

	def create
		@user = User.new(user_params)
		@users = User.all
		@roles = view_context.my_roles
		@states = State.all
		
		if @user.save
			redirect_to(action: "show", id: @user)
		else
			render action: "new"
		end
	end

	def edit
		@user = User.find(params[:id])
		@users = User.where.not(admin: true)
		@roles = view_context.my_roles
		@states = State.all
		
	end

	def update
		@states = State.all
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

	def can_change
		unless user_signed_in? && current_user == user
			redirect_to user_path(params[:id])
		end
	end

	def confirmation_email
		if User::ValidRoles.include?(@user.role) and @user.confirmed? == false
			@user.send_confirmation_instructions
		end
	end
end 