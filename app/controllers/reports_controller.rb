class ReportsController < ApplicationController
	before_action :authenticate_user!
	def index
		@report = Report.new(current_user, "February")
	end
end