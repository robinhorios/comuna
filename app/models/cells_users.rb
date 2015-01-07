class CellsUsers < ActiveRecord::Base
	belongs_to :user
	belongs_to :cell
end