require 'nokogiri'
require 'open-uri'

class FakeName
  ENDPOINT = 'https://fakena.me/random-real-address/'

  def doc
    @doc ||= Nokogiri::HTML(open(ENDPOINT))
  end
end

#=====================begin==============================
# CREATE USERS
# Create education options for users
education_options = ["High-School","Bachelors Degree","Masters Degree"]

# Create 3 users
3.times do
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	st_num_name = FakeName.new.doc.at_xpath("//strong").children[0].text
	city_state_zip = FakeName.new.doc.at_xpath("//strong").children[2].text
	User.create!(
		:first_name => first_name,
		:last_name => last_name,
		:email => Faker::Internet.email(first_name + "." + last_name),
		:password => "password",
		:city => city_state_zip.split(',').first,
		:state => city_state_zip.match(/\b(\w{2})\b/),
		:zip => city_state_zip.match(/\b(\d{5})/).to_s.to_i,
		:st_num => st_num_name.match(/^(\d+\W|[a-z]+)?(\d+)([a-z]?)\b/).to_s.to_i,
		:st_name => st_num_name.split(' ').drop(1).join(' '),
		:phone => Faker::PhoneNumber.cell_phone,
		:occupation => Faker::Name.title,
		:education => education_options.shuffle.last,
		:description => Faker::Lorem.paragraph(sentence_count = 10),
		:avatar => Faker::Avatar.image
	)
end
#^^^^^^^^^^^^^^^^^end^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#=====================begin==============================
# CREATE CATEGORIES AND SKILLS
# Create 11 categories
categories = ["Art","Business","Communication","Cooking","IT","Languages","Manufacturing","Music","Science","Sport","Others"]
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
#^^^^^^^^^^^^^^^^^end^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



# user.collections.create(skill_id: 1, years_of_experience: 2, hourly_rate: 13, description: "I am really good at teaching and have an intermediate fluency with Spanish.")


# Request.create(sender_id: 1, reciever_id: 2 , skill_id: 1, accepted: true , content: "I will like to tutor with you, if you are available?")

# skills.each do |skill|
#       Skill.create!(name: skill, category_id: 1)
# end


# users.each do |user|
#       user.skills.build(name: languages[rand(0..languages.length)])
#       user.save
# end