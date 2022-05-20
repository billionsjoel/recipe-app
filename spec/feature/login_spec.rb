require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  describe 'loging page' do
    it 'Should access the log in page' do
      visit 'users/sign_in'
      expect(page).to have_content('Log in')
    end

    it 'Shoud see the user name, email and pasword field' do
      visit 'users/sign_in'
      expect(page).to have_field('Email', type: 'email')
      expect(page).to have_field('Password', type: 'password')
      expect(page).to have_button('Log in', type: 'submit')
    end

    it 'Should raise an error if email or password is not filled' do
      visit 'users/sign_in'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end
end
