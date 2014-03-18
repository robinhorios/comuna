class CreateGcemsUsers < ActiveRecord::Migration
	def change
		create_table :gcems_users do |t|
			t.references :gcem, index: true
			t.references :user, index: true
		end
	end
end
