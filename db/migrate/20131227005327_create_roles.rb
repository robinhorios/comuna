class CreateRoles < ActiveRecord::Migration
  def up
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    Role.create! name: 'Visitante'
    Role.create! name: 'Membro'
    Role.create! name: 'Membro afastado'
    Role.create! name: 'Auxiliar'
    Role.create! name: 'Líder'
    Role.create! name: 'Supervisor'
    Role.create! name: 'Supervisor de Área'
    Role.create! name: 'Supervisor de Distrito'
  end

  def down
  	drop_table :roles
  end
end
