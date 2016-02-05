#!!!!!!!!!!!!
# Due to the random nature of the fakename address website
# you may have errors when running the seed file.
# If so, just run it again and you should be good to go.
#!!!!!!!!!!!!

#=====================begin==============================
# CREATE USERS

# THIS GRABS VALID, RANDOM ADDRESSES FROM Fakename WEBSITE
# require 'nokogiri'
# require 'open-uri'

# class FakeName
#   ENDPOINT = 'https://fakena.me/random-real-address/'

#   def doc
#     @doc ||= Nokogiri::HTML(open(ENDPOINT))
#   end
# end
		# st_num_name = FakeName.new.doc.at_xpath("//strong").children[0].text # Parse the street number and name from the HTML
		# city_state_zip = FakeName.new.doc.at_xpath("//strong").children[2].text # Parse the city, state, zip from the HTML
		# :city => city_state_zip.split(',').first,
		# :state => city_state_zip.match(/\b(\w{2})\b/),
		# :zip => city_state_zip.match(/\b(\d{5})/).to_s.to_i,
		# :st_num => st_num_name.match(/^(\d+\W|[a-z]+)?(\d+)([a-z]?)\b/).to_s.to_i,
		# :st_name => st_num_name.split(' ').drop(1).join(' '),


# Create education options for users
education_options = ["High-School","Bachelors Degree","Masters Degree"]

addresses = {}
addresses["address1"] = { st_num: 2431,
												 st_name: "N Talman",
												 city: "Chicago",
												 state: "IL",
												 zip: 60647 }
addresses["address2"] = { st_num: 2739,
												 st_name: "N Spaulding",
												 city: "Chicago",
												 state: "IL",
												 zip: 60647 }
addresses["address3"] = { st_num: 2719,
												 st_name: "N Paulina St",
												 city: "Chicago",
												 state: "IL",
												 zip: 60616 }
addresses["address4"] = { st_num: 142,
												 st_name: "N Hermitage",
												 city: "Chicago",
												 state: "IL",
												 zip: 60612 }
addresses["address5"] = { st_num: 1720,
												 st_name: "S Indiana",
												 city: "Chicago",
												 state: "IL",
												 zip: 60616 }
addresses["address6"] = {
													st_num: 830,
													st_name: "N Michigan Ave",
													city: "Chicago",
													state: "IL",
													zip:  60611}
addresses["address7"]= { st_num: 5050,
												 st_name: "N Sheridan Rd",
												 city: "Chicago",
												 state: "IL",
												 zip: 60640 }
addresses["address8"] = {st_num: 210,
	                       st_name: "W Kinzie St",
	                       city: "Chicago",
	                       state: "IL",
	                       zip: 60654}
addresses["address9"] = {st_num: 127,
												st_name: "W Huron St",
												city: "Chicago",
												state: "IL",
												zip: 60654
												}
addresses["address10"] = {
													st_num: 1471,
													st_name: "N Milwaukee Ave",
													city: "Chicago",
													state: "IL",
													zip: 60622
		 											}
 addresses["address11"] = {		
 													st_num: 941,		
 													st_name: "N Damen",		
 													city: "Chicago",		
 													state: "IL",		
 													zip: 60622}		
 																								      		
 		
 addresses["address12"] = {		
 													st_num: 3658,		
 													st_name: "W Lawrence Ave",		
 													city: "Chicago",		
 													state: "IL",		
 													zip: 60625	}	
 														
 addresses["address13"] = {		
 													st_num: 104,		
 													st_name: "E Oak St",		
 													city: "Chicago",		
 													state: "IL",		
 													zip: 60611		
 												} 												      		
 addresses["address14"] = {		
 													st_num: 980,		
 													st_name: "N Michigan Ave",		
 													city: "Chicago",		
 													state: "IL",		
 													zip: 60611		
 												} 		
 addresses["address15"] = {		
 													st_num: 230,		
 													st_name: "W Kinzie St",		
 													city: "Chicago",		
 													state: "IL",		
 													zip: 60654		
 												} 																						      		
 addresses["address16"] = {		
 													st_num: 8266,		
 													st_name: "N Lincoln Ave",		
 													city: "Skokie",		
 													state: "IL",		
 													zip: 60077		
 												} 		
 addresses["address17"] = {		
 													st_num: 203,		
 													st_name: "N Wabash",		
 													city: "Chicago",		
 													state: "IL",		
 													zip: 60604		
 												} 		
 addresses["address18"] = {		
 													st_num: 2010,		
 													st_name: "W Fulton St",		
 													city: "Chicago",		
 													state: "IL",		
 													zip: 60612		
 												} 		
 addresses["address19"] = {		
 													st_num: 910,		
 													st_name: "W Buena Ave",		
 													city: "Chicago",		
 													state: "IL",		
 													zip: 60613		
 												} 		
 addresses["address20"] = {		
 													st_num: 18,		
 													st_name: "W Hubbard St",		
 													city: "Chicago",		
 													state: "IL",		
 													zip: 60654	}	
 																								
# Create users
20.times do |t|
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name

	User.create!(
		:first_name => first_name,
		:last_name => last_name,
		# :email => Faker::Internet.email(first_name + "." + last_name),
		:email => "test#{t+1}@gmail.com",
		:password => "password",
		:city => addresses["address#{t+1}"][:city],
		:state => addresses["address#{t+1}"][:state],
		:zip => addresses["address#{t+1}"][:zip],
		:st_num => addresses["address#{t+1}"][:st_num],
		:st_name => addresses["address#{t+1}"][:st_name],
		:phone => Faker::PhoneNumber.cell_phone,
		:occupation => Faker::Name.title,
		:education => education_options.shuffle.last,
		:description => Faker::Lorem.paragraph(sentence_count = 10),
		:avatar => Faker::Avatar.image
	)
end

User.find(1).update_attributes(first_name: "Parminder", last_name: "Signh", avatar: "http://i.imgur.com/g3aAJPr.jpg%3F1")
User.find(2).update_attributes(first_name: "Pamela", last_name: "Antonow", avatar: "http://i.imgur.com/xdt2AAZ.jpg?1")
User.find(3).update_attributes(first_name: "Alex", last_name: "Nowak", avatar: "http://i.imgur.com/V5G33QO.jpg?1")
User.find(4).update_attributes(first_name: "Shea", last_name: "Munion", avatar: "i.imgur.com/ZSMJtSN.jpg?1")
#^^^^^^^^^^^^^^^^^end^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#=====================begin==============================
# CREATE CATEGORIES AND SKILLS

# Create 11 categories
categories = ["Art","Business","Communication","Cooking","IT","Languages","Manufacturing","Music","Science","Sport","Math and Logic", "Others"]
categories.each do |category|
 Category.create!(name: category)
end

# Create three skills for the IT category
programming_languages =["Ruby", "PHP", "JavaScript"]

programming_languages.each do |skill|
      Category.where(name: "IT").first.skills.create!(name: skill)
end

# Create three skills for the language category
languages =["Spanish", "English", "Polish"]

languages.each do |skill|
      Category.where(name: "Languages").first.skills.create!(name: skill)
end

# Create three skills for the music category
music_skills =["Guitar", "Music theory", "Piano"]

music_skills.each do |skill|
      Category.where(name: "Music").first.skills.create!(name: skill)
end

#Create three skills for business category
business_skills = ["Marketing","Management", "Economic"]

business_skills.each do |skill|
	Category.where(name: "Business").first.skills.create!(name: skill)
end

#Create three skills for the art category
art_skills = ["Graphic Design", "Photography", "Painting"]

art_skills.each do |skill|
	Category.where(name: "Art").first.skills.create!(name: skill)
end

#Create two skills for the cooking category
cooking_skills = ["Gastronomy", "Food and health"]
cooking_skills.each do |skill|
	Category.where(name: "Cooking").first.skills.create!(name: skill)
end

#Create three skill for the math category
math_skills = ["Algebra", "Calculus", "Geometry"]
math_skills.each do |skill|
	Category.where(name: "Math and Logic").first.skills.create!(name: skill)
end

#Create three skill for sports category
sport_skills = ["Soccer", "Baseball", "Hockey"]

sport_skills.each do |skill|
	Category.where(name: "Sport").first.skills.create!(name: skill)
end

communication_skills = ["Social media","Writing", "Presentation"]

communication_skills.each do |skill|
	Category.where(name: "Communication").first.skills.create!(name: skill)
end

#Create two skills for the manufacturing category
manufacturing_skills = ["Electrical","Mechanic"]

manufacturing_skills.each do |skill|
	Category.where(name: "Manufacturing").first.skills.create!(name: skill)
end

#Create two skills for the manufacturing category

science_skills = ["Biology","Chemistry", "Cardiology"]

science_skills.each do |skill|
 Category.where(name: "Science").first.skills.create!(name: skill)
end

#^^^^^^^^^^^^^^^^^end^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#=====================begin==============================
# CREATE COLLECTIONS

first_user = User.find(1)
first_user.collections.create!(skill_id: 1, # Ruby
															years_of_experience: 2,
															hourly_rate: 45,
															description: "I am really good at teaching and have an intermediate fluency with Ruby.")
first_user.collections.create!(skill_id: 2, # PHP
															years_of_experience: 7,
															hourly_rate: 45,
															description: "I worked as a PHP Senior Dev for 5 years and before that as a PHP junior dev for two years.")
first_user.collections.create!(skill_id: 3, # JavaScript
															years_of_experience: 4,
															hourly_rate: 45,
															description: "I am quite experienced with JS. I've been using it professionally for four years now.")
first_user.collections.create!(skill_id: 6, # Polish
															years_of_experience: 42,
															hourly_rate: 30,
															description: "I am a native Polish speaker and know a lot about Polish culture. I will teach you more than just the language...I will bring it to life!")
first_user.collections.create!(skill_id: 7, # Guitar
															years_of_experience: 5,
															hourly_rate: 15,
															description: "I am an intermediate guitar player. I also tutor people in Polish so I have experience teaching people. Let's jam!")

second_user = User.find(2)
second_user.collections.create!(skill_id: 4, # Spanish
															years_of_experience: 23,
															hourly_rate: 18,
															description: "I am a native speaker.")
second_user.collections.create!(skill_id: 8, # Piano
															years_of_experience: 15,
															hourly_rate: 60,
															description: "I have been practicing and playing music for over a decade. I studied music theory in university.")
second_user.collections.create!(skill_id: 9,
															years_of_experience: 15,
															hourly_rate: 60, # Music theory
															description: "I play piano semiprofessionally. I have practiced it for more than a decade. I can help you learn it really well.")

third_user = User.find(3)
third_user.collections.create!(skill_id: 3, # JavaScript
															years_of_experience: 12,
															hourly_rate: 80,
															description: "I am a JavaScript master. Just checkout my website or github.")
fourth_user = User.find(4)
fourth_user.collections.create!(skill_id: 5, # English
															years_of_experience: 28,
															hourly_rate: 25,
															description: "I studied Enlgish in college and earned a Masters degree in linguistics at Oxford.")
fourth_user.collections.create!(skill_id: 4, # Spanish
															years_of_experience: 14,
															hourly_rate: 25,
															description: "I have a nearnative fluency in Spanish. I lived in Spain for 10 years and spoke exclusively in Spanish.")

fifth_user = User.find(5)
fifth_user.collections.create!(skill_id: 7, # Guitar
															years_of_experience: 9,
															hourly_rate: 20,
															description: "I have a band. Checkout our website and listen to my music. I can work with beginners, intermediates, and experts. Whatever your level, I can help you advance!")
sixth_user = User.find(6)
sixth_user.collections.create!(skill_id: 9, #Marketing,
															 years_of_experience: 6,
															 hourly_rate: 15,
															 description: "I worked for 6 years in the field, and I love sharing my knowledge. ")
seventh_user = User.find(7)
seventh_user.collections.create!(skill_id: 30,#chemistry
																years_of_experience: 9,
																hourly_rate: 30,
																description: "I have been in the field for 9 years. I have a master in Chimistry as well."
																)
eight_user = User.find(8)
eight_user.collections.create!(skill_id: 14,#photography
																years_of_experience: 15,
																hourly_rate:40,
																description: "Worked with Vogue magazine and other big magazines as well with major fashion Icons.")
ninth_user = User.find(9)
ninth_user.collections.create!(skill_id: 20,#Geometry,
																years_of_experience: 20,
																hourly_rate: 30,
																description: "Geometry professor in Harvard , have been teaching Math for 20 years."
															)
tenth_user = User.find(10)
tenth_user.collections.create!(skill_id:16,#Gastronomy
															 years_of_experience: 6,
															 hourly_rate: 10,
															 description: "Studied Gastronomy in France and was the main chef of Le Jules Verne in Paris")
															 	
eleven_user = User.find(11)		
eleven_user.collections.create!(skill_id:13,#Graphic design		
 															 years_of_experience: 7,		
 														 hourly_rate: 15,		
 															 description: "Worked in graphic design for about 7 years with one of the biggest companies")			
 twelve_user = User.find(12)		
 eleven_user.collections.create!(skill_id:18,#Algebra		
 															 years_of_experience: 20,		
 															 hourly_rate: 25,		
 															 description: "Algebra professor in Harvard")			
 thirten_user = User.find(13)		
 thirten_user.collections.create!(skill_id:13,
 																	years_of_experience: 3,		
 															 hourly_rate: 10,		
 															 description: "Have a master degree in Food and health`")			
 fourteen_user = User.find(14)		
 fourteen_user.collections.create!(skill_id:13,
 																	years_of_experience: 7,		
 															 hourly_rate: 15,		
 															 description: "Worked in graphic design for about 7 years with one of the biggest companies")			
 fifteen_user = User.find(15)		
 fifteen_user.collections.create!(skill_id:25,#Writing		
 															 years_of_experience: 5,		
 															 hourly_rate: 20,		
 															 description: "I wrote a whole book.")
 sixteen_user = User.find(16)		
 sixteen_user.collections.create!(skill_id:13,#Graphic design		
 															 years_of_experience: 7,		
 															 hourly_rate: 15,		
 															 description: "Worked in graphic design for about 7 years with one of the biggest companies")	
 seventeen_user = User.find(17)		
 seventeen_user.collections.create!(skill_id:13,#Graphic design		
 															 years_of_experience: 7,		
 															 hourly_rate: 15,		
 															 description: "Worked in graphic design for about 7 years with one of the biggest companies")			
 eighteen_user = User.find(18)		
 eighteen_user.collections.create!(skill_id:12,#Graphic design		
 															 years_of_experience: 10,		
 															 hourly_rate: 15,		
 															 description: "Professor in LMU")			
 nineteen_user = User.find(19)		
 nineteen_user.collections.create!(skill_id:11,#Graphic design		
 															 years_of_experience: 3,		
 															 hourly_rate: 3,		
 															  description: "I draw better than picasso")
 twenty_user = User.find(20)		
 twenty_user.collections.create!(skill_id:15,		
 															 years_of_experience: 50,		
 															 hourly_rate: 150,		
 															 description: "I draw better than picasso")			
 															 															 															 															 															 															 															 															 															 															       		
 #Graphic design#Food and health		
#^^^^^^^^^^^^^^^^^end^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#=====================begin==============================
# CREATE REQUESTS

r1 = Request.create!(
	sender_id: first_user.id,
  receiver_id: second_user.id,
  skill_id: 8,
  accepted: nil,
  content: "Hey, I'd love to learn piano. I can meet any weeknight after 6:00 pm.")
r2 = Request.create!(
	sender_id: second_user.id,
  receiver_id: third_user.id,
  skill_id: 3,
  accepted: nil,
  content: "I am building my own website and need help with JavaScript. I can meet in the mornings on weekends.")
r3 = Request.create!(
	sender_id: fifth_user.id,
  receiver_id: first_user.id,
  skill_id: 1,
  accepted: nil,
  content: "I really want to learn Ruby. I hear it's the hotness. Send me an email so we can coordinate. #{fifth_user.email}")
r4 = Request.create!(
	sender_id: fourth_user.id,
  receiver_id: first_user.id,
  skill_id: 1,
  accepted: nil,
  content: "Let's do this!")
#^^^^^^^^^^^^^^^^^end^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#=====================begin==============================
# CREATE MESSAGES

# Messages for Request 1
Message.create!(user_id: second_user.id, request_id: r1.id, content: "I'd love to connect. I am free on Tuesdays. Does that work?")
Message.create!(user_id: first_user.id, request_id: r1.id, content:  "Oh shoot! I forgot I have practice on Tuesdays. How about Thursdays?")
Message.create!(user_id: second_user.id, request_id: r1.id, content: "Yup. Thursday works. Let's start this week.")
Message.create!(user_id: first_user.id, request_id: r1.id, content:  "Ok! Where should we meet?")
Message.create!(user_id: second_user.id, request_id: r1.id, content: "There is a piano studio below my home. We can meet there at 6:00 p.m.")
Message.create!(user_id: first_user.id, request_id: r1.id, content:  "YAY! See you soon!")

# Messages for Request 2
Message.create!(user_id: third_user.id, request_id: r2.id, content: "Hi! I'm happy to help you with JS. When can we meet?")
Message.create!(user_id: second_user.id, request_id: r2.id, content: "How about next Saturday at 9 am?")
Message.create!(user_id: third_user.id, request_id: r2.id, content: "Yeah, I can do that. I'll bring my laptop.")
Message.create!(user_id: second_user.id, request_id: r2.id, content: "Great, I'll bing mine too. Do you know a good place to meet?")
Message.create!(user_id: third_user.id, request_id: r2.id, content: "There's a Starbucks right down the street from me. I'll see you there at 9:00 a.m.")
Message.create!(user_id: second_user.id, request_id: r2.id, content: "Great! See you then.")

#^^^^^^^^^^^^^^^^^end^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#=================Begin===================
#CREATE REVIEWS
#Review for first user
Review.create!(sender_id: first_user.id,receiver_id: fourth_user.id, content: "Really recommend this teacher, the lesson was great! I feel like I know way more than I just to.", rating: 5 )
Review.create!(sender_id: second_user.id,receiver_id: fourth_user.id, content: "It was a good session, but the teacher was a little late , other than that I really recommend it!", rating: 4)
Review.create!(sender_id: sixth_user.id,receiver_id: fourth_user.id, content: "The teacher cancelled on me an hour before meeting, and didn't give a reason why. I honestly don't recommend this teacher",rating: 2 )
Review.create!(sender_id: fifth_user.id,receiver_id: fourth_user.id, content: "I had a test and was really worried that I wasn't going to know enough before the test, but thanks to the tutoring that I had I was able to pass it!", rating: 5 )
#Review for third user
Review.create!(sender_id: third_user.id,receiver_id: first_user.id, content: "Really recommend this teacher, the lesson was great! I feel like I know way more than I just to." )
Review.create!(sender_id: seventh_user.id,receiver_id: first_user.id, content: "Really recommend this teacher, the lesson was great! I feel like I know way more than I just to." )
Review.create!(sender_id: ninth_user.id,receiver_id: first_user.id, content: "Really recommend this teacher, the lesson was great! I feel like I know way more than I just to." )

#Review for the fifth user
Review.create!(sender_id: third_user.id,receiver_id: fifth_user.id, content: "Really recommend this teacher, the lesson was great! I feel like I know way more than I just to." )
Review.create!(sender_id: first_user.id,receiver_id: fifth_user.id, content: "Really recommend this teacher, the lesson was great! I feel like I know way more than I just to." )
Review.create!(sender_id: fourth_user.id,receiver_id: fifth_user.id, content: "Really recommend this teacher, the lesson was great! I feel like I know way more than I just to." )
