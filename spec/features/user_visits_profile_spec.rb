require 'rails_helper'

feature 'User profile' do
	scenario "has a skills section" do
		login
		visit(user_path(find_bob))
		expect(page).to have_content("Skills")
	end
	scenario "has a reviews section" do
		login
		visit(user_path(find_bob))
		expect(page).to have_content("Reviews")
	end
	scenario "has an about me section" do
		login
		visit(user_path(find_bob))
		expect(page).to have_content("About me")
	end
end