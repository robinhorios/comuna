class EventsController < ApplicationController
	def index
		@events = current_user.events
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
		@users = view_context.my_users
	end

	def create
		@event = Event.new(event_params)
		
		if @event.save
			redirect_to(action: "show", id: @event)
		else
			render action: "new"
		end
	end

	def edit
		@event = Event.find(params[:id])
		@users = User.all
	end

	def update
		params[:event][:user_ids] ||= []
		@event = Event.find(params[:id])
		if @event.update_attributes(event_params)
			redirect_to @event, notice: "Successfully created product."
		else
			render :edit
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_url, notice: "Successfully destroyed event."
	end

	private

	def event_params
		params.require(:event).permit!
	end
end