#encoding: utf-8

class Cell < ActiveRecord::Base

	validates :name, :street, :schedule, presence: true 

	belongs_to :state
	belongs_to :category
	has_and_belongs_to_many :users
end