require 'rails_helper'

RSpec.describe 'recipes app', type: :feature do
  describe ' post index page' do
    before(:each) do
      visit user_session_path
      @user1 = User.create!( email: 'dev@dev.co', password: '1111123', confirmed_at: Time.now)
      fill_in 'Email', with: 'dev@dev.co'
      fill_in 'Password', with: '1111123'
      click_button 'Log in'
  
      @food1 = @user1.foods.create!(name: 'Rice', price: 90, measurement_unit: 'gram')
      visit foods_path

    end

    it 'Should see the user\'s profile picture' do
      expect(page).to have_content(@food1.name)
      expect(page).to have_content('Rice')
      expect(page).to have_content(90)
    end
  end
end
