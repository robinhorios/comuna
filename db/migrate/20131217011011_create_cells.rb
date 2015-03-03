class CreateCells < ActiveRecord::Migration
  def up
    create_table :cells do |t|
      t.string :name
      t.string :street
      t.string :number
      t.string :complement
      t.string :zipcode
      t.string :district
      t.string :city
      t.integer :state_id
      t.integer :categoty_id
      t.string :schedule
      t.string :host
      t.string :week_day

      t.timestamps
    end
  end

  def down
    drop_table :cells
  end
end
