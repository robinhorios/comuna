class AddGcemAndUser < ActiveRecord::Migration
	def self.up
		create_table :gcems_users, id: false do |t|
			t.integer :gcem_id
			t.integer :user_id
			t.references :gcem, :user
		end
	end

	def self.down
		drop_table :gcems_users
	end
end

