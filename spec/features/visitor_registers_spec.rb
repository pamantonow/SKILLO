require 'rails_helper'

feature 'Visitor registers' do
  scenario 'with valid information' do
    register_with 'valid@example.com', 'password', 'bob', 'bob', 'Chicago', 'IL', 60658, 213, 'W Hubbard', '555-555-5555', 'Doctor', 'Masters', 'I like cows.', 14.43, 245355

    expect(page).to have_content('Logout')
  end

  scenario 'with invalid zipcode and street number' do
    register_with 'invalidexamplecom', 'password', 'bob', 'bob', 'Chicago', 'IL', "7a658", "213a", 'W Hubbard', '555-555-5555', 'Doctor', 'Masters', 'I like cows.', 14.43, 245355

    expect(page).to have_content('Login')
  end

  scenario 'with blank password' do
    register_with 'valid@example.com', '', 'bob', 'bob', 'Chicago', 'IL', 60658, 213, 'W Hubbard', '555-555-5555', 'Doctor', 'Masters', 'I like cows.', 14.43, 245355

    expect(page).to have_content('Login')
  end
end