require 'rails_helper'

feature 'User logs in' do

	before :each do
		User.destroy_all
	end

  scenario 'with valid information' do
  	login

    expect(page).to have_content('Logout')
  end

  scenario 'and is redirected to their profile' do
  	login

  	expect(page.current_path).to eq(user_path(find_bob))
  end
end