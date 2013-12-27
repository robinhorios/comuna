class AddGcemAndUser < ActiveRecord::Migration
	def self.up
		create_table :gcems_users do |t|
			t.references :gcem, :user
		end
	end

	def self.down
		drop_table :gcems_users
	end
end

