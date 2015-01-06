class GcemsUsers < ActiveRecord::Base
	belongs_to :user
	belongs_to :gcem
end