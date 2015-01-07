class CreateCellsUsers < ActiveRecord::Migration
	def change
		create_table :cells_users do |t|
			t.references :cell, index: true
			t.references :user, index: true
		end
	end
end
