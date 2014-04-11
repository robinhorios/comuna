class EventsUserController < ApplicationController
	def index
		 @events_user = EventsUser.all
	end

	def new
		@events_user = EventsUser.new
		@users = User.all
		@events = Event.all
	end

	def create
		@events_user = EventsUser.new(events_user[:paramas])
		if @events_user.save
			redirect_to(action: "show", id: @events_user)
		else
			render "new"
		end
	end
end