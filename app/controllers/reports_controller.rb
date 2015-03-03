class ReportsController < ApplicationController
	def index
		@report = Report.new(current_user, "February")
	end
end