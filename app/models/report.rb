class Report
	def initialize(user, month)
		@user = user
		@month = month
	end

	def leader
		@user.name
	end

	def leaders
		leaders = []
		@user.cells.each do |cell|
			cell.users.each do |user|
				if user.role == User::Leader
					leaders.push(user)
				end
			end
		end
		leaders
	end

	def supervisor
		@user.cells.each do |cell|
			cell.users.each do |user|
				if user.role == User::Supervisor
					return user.name
				end
			end
		end
	end

	def assist
		@user.cells.each do |cell|
			cell.users.each do |user|
				if user.role == User::Assist
					return user.name
				end
			end
		end
	end

	def assist_in_training
		name = ""
		@user.cells.each do |cell|
			cell.users.each do |user|
				if user.role == User::AssistInTraining
					name = user.name
				else
					name = "Está célula ainda não tem Auxiliar em Treinamento"
				end
			end
		end
		name 
	end

	def schedule
		@user.cells.first.schedule
	end

	def week_day
		@user.cells.first.week_day
	end

	def month
		Date::MONTHNAMES.index(@month)
	end

	def year
		Time.now.year
	end

	def age(date_of_birth)
		now = Time.now.utc.to_date
		now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
	end

	def peoples_in_meeting(user)
		children_under_11_years = 0
		adolescents_aged_12_to_14_years = 0
		adolescents_aged_14_to_17_years = 0
		men_singles = 0
		married_man = 0
		single_woman = 0
		wife = 0
		data_of_meetings = []
		events = user.events.where(:created_at => Date.new(Date.today.year, Date.today.month, 1)...Date.new(Date.today.year, Date.today.month, -1))
		events.each_with_index do |event, index|

			event.users.each_with_index do |user, index|
				if age(user.date_of_birth) <= 11
					children_under_11_years += 1
				elsif age(user.date_of_birth) > 11 and age(user.date_of_birth) <= 14 
					adolescents_aged_12_to_14_years += 1
				elsif age(user.date_of_birth) > 12 and age(user.date_of_birth) <= 17 
					adolescents_aged_14_to_17_years += 1
				elsif age(user.date_of_birth) > 14 and user.gender == "Masculino" and user.married? == false
					men_singles += 1
				elsif age(user.date_of_birth) > 14 and user.gender == "Masculino" and user.married? == true
					married_man += 1
				elsif age(user.date_of_birth) > 14 and user.gender == "Feminino" and user.married? == false
					single_woman += 1
				elsif age(user.date_of_birth) > 14 and user.gender == "Feminino" and user.married? == true
					wife +=1
					
				end
			end

			data_of_meetings.push(["c" => children_under_11_years, 
								   "a" => adolescents_aged_12_to_14_years, 
								   "aa" => adolescents_aged_14_to_17_years, 
								   "ms" => men_singles, 
								   "sw" => single_woman, 
								   "wf" => wife, 
								   "mm" => married_man,
								   "tt" => (children_under_11_years + 
								   			adolescents_aged_12_to_14_years + 
								   			adolescents_aged_14_to_17_years + 
								   			men_singles + 
								   			single_woman + 
								   			wife +
								   			married_man
								   		)
								  ])
			
			children_under_11_years = 0
			adolescents_aged_12_to_14_years = 0
			men_singles = 0
			married_man = 0
			single_woman = 0
			wife = 0

		end
		data_of_meetings
	end

	def average(user)
	end

end