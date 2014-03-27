class EventsController < ApplicationController
	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])

	end

	def new
		@event = Event.new
		@users = User.all
	end

	def create
		@event = Event.new(events_params)
		
		if @event.save
			redirect_to(action: "show", id: @event)
		else
			render action: "new"
		end
	end

	private
	def events_params
		params.require(:event).permit(:name, :schedule, :event_day)
	end
end