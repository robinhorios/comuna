class Event < ActiveRecord::Migration
  def change
  	create_table :events do |t|
  		t.string :name
  		t.string :event_day
  		t.string :schedule
  	end
  end
end
