class CreateStates < ActiveRecord::Migration
	def up
		create_table :states do |t|
			t.string :name
			t.string :acronym
		end

		states = [
			{name: "Acre",acronym: "AC"},
			{name: "Alagoas",acronym: "AL"},	 
			{name: "Amapá",acronym: "AP"},
			{name: "Amazonas",acronym: "AM"},	 
			{name: "Bahia",acronym: "BA"},	 
			{name: "Ceará",acronym: "CE"},	 
			{name: "Distrito Federal",acronym: "DF"},	 
			{name: "Espírito Santo",acronym: "ES"},	 
			{name: "Goiás",acronym: "GO"},	 
			{name: "Maranhão",acronym: "MA"},	 
			{name: "Mato Grosso",acronym: "MT"},	 
			{name: "Mato Grosso do Sul",acronym: "MS"},	 
			{name: "Minas Gerais",acronym: "MG"},	 
			{name: "Pará",acronym: "PA"},	 
			{name: "Paraíba",acronym: "PB"},	 
			{name: "Paraná",acronym: "PR"},	 
			{name: "Pernambuco",acronym: "PE"},	 
			{name: "Piauí",acronym: "PI"},	 
			{name: "Rio de Janeiro",acronym: "RJ"},	 
			{name: "Rio Grande do Norte",acronym: "RN"},	 
			{name: "Rio Grande do Sul",acronym: "RS"},	 
			{name: "Rondônia",acronym: "RO"},	 
			{name: "Roraima",acronym: "RR"},	 
			{name: "Santa Catarina",acronym: "SC"},	 
			{name: "São Paulo",acronym: "SP"},	 
			{name: "Sergipe",acronym: "SE"},	 
			{name: "Tocantins",acronym: "TO"}
		]

		states.each do |state|
			State.create! name: state[:name], acronym: state[:acronym]
		end

	end

	def down
		drop_table :states
	end
end
