class CreateCells < ActiveRecord::Migration
  def up
    create_table :cells do |t|
      t.string :name
      t.string :address
      t.string :schedule
      t.string :host
      t.string :week_day

      t.timestamps
    end

    Cell.create! name: 'Éden', address: "Rua Legal", schedule: "17:30", host: "Robinson Rios da Silva", week_day: "Sábado"
    Cell.create! name: 'Ainda', address: "Rua Legal", schedule: "17:30", host: "Kevernilson Lima", week_day: "Sábado"
    Cell.create! name: 'Hadar', address: "Rua Legal", schedule: "17:30", host: "Rodrigo Coça Coça", week_day: "Sábado"
    
  end

  def down
    drop_table :cells
  end
end
