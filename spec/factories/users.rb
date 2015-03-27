#encoding: utf-8
FactoryGirl.define do
	factory :admin, :class => User do
		email "admin@org.br"
		password 'teste123'
		name 'admin'
		admin true
	end

	factory :cell, :class => Cell do
    	name 'Éden'
		street 'Rua Tal'
		schedule '17:30'
	end

	factory :user do
		cells {[FactoryGirl.create(:cell)]}
   		email "john@org.br"
		password 'john123456'
		name 'John'
		admin false
	end
end
