module Features
  module SessionHelpers
    def register_with(email, password, first_name, last_name, city, state, zip, st_num, st_name, phone, occupation, education, description, longitude, latitude)
      visit signup_path
      fill_in "First name", with: first_name
      fill_in "Last name", with: last_name
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in "city", with: city
      fill_in "state", with: state
      fill_in "zip code", with: zip
      fill_in "Street number", with: st_num
      fill_in "Street name", with: st_name
      # fill_in "phone", with: phone
      # fill_in "occupation", with: occupation
      # fill_in "education", with: education

      click_button 'Register'
    end

    def login
      bob = User.create!(email: 'bob@gmail.com', password: 'password', first_name: 'bob', last_name: 'bob', city: 'Chicago', state: 'IL', zip: 60658, st_num: 213, st_name: 'W Hubbard', phone: '555-555-5555', occupation: 'Doctor', education: 'Masters', description: 'I like cows.', longitude: 14.43, latitude: 24.5355)
      visit login_path
      fill_in 'Email', with: bob.email
      fill_in 'Password', with: bob.password
      click_button 'Login'
    end
  end
end