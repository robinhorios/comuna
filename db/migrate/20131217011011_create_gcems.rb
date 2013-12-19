class CreateGcems < ActiveRecord::Migration
  def change
    create_table :gcems do |t|
      t.string :name
      t.string :address
      t.string :schedule
      t.string :host

      t.timestamps
    end
  end
end
