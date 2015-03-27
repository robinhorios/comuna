require "rails_helper"

describe 'User' do
	
	before(:each) do
		@admin = FactoryGirl.build :admin
		@user = FactoryGirl.build :user
		@cell = FactoryGirl.create :cell
		@user_attr = FactoryGirl.attributes_for(:user)

	end

	describe 'The user is admin' do
		it 'return "true" when user is admin' do
			expect(@admin.admin?).to be true  
		end
	end

	describe 'The user is not admin' do
		it 'return "false" when user is not admin' do
			expect(@user.admin?).to be false  
		end
	end

	describe 'User new' do
		it 'create the new user' do
			User.create!(@user_attr)			
		end
	end
end