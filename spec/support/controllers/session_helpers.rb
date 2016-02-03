module Controllers
    module SessionHelpers

   def create_bob
      User.create!(email: 'bob@gmail.com', password: 'password', first_name: 'bob', last_name: 'bob', city: 'Chicago', state: 'IL', zip: 60658, st_num: 213, st_name: 'W Hubbard', phone: '555-555-5555', occupation: 'Doctor', education: 'Masters', description: 'I like cows.', longitude: 14.43, latitude: 24.5355)
    end

  end
end