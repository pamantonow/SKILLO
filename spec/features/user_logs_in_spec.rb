require 'rails_helper'

feature 'User logs in' do
  scenario 'with valid information' do
  	login

    expect(page).to have_content('Logout')
  end
end