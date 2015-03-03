#encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

User.create! email: 'robinho.rios@hotmail.com', 
password: 'robinhorios', 
admin: true

Cell.create! name: 'Éden', street: "Rua Legal", schedule: "17:00", host: "Robinson Rios", week_day: "Sábado"
Cell.create! name: 'Ainda', street: "Travessa Dom Bosco", schedule: "17:30", host: "Kevernilson Lima", week_day: "Sábado"
Cell.create! name: 'Hadar', street: "Rua Legal", schedule: "17:30", host: "Rodrigo Coça Coça", week_day: "Sábado"



