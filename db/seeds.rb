
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# user = User.create!(

#        :first_name => "Ana",
#        :last_name => "Nowak",
#        :email => "qwff@icstars.org",
#        :password => "olaolaola",
#        :city => "Chicago",
#        :state => "IL",
#        :zip => "60654",
#        :st_num => "900",
#        :st_name => "Michigan Ave",
#        :phone => "7736009632",
#        :occupation => "Developer",
#        :education => "High-School",
#        :description => "Intelligentsia blog fap waistcoat, biodiesel viral disrupt. Next level schlitz vinyl, thundercats shabby chic freegan roof party affogato plaid. Farm-to-table readymade bitters, literally lo-fi drinking vinegar raw denim marfa pour-over shabby chic umami hella bushwick PBR&B austin. Single-origin coffee microdosing shabby chic, fingerstache meditation listicle freegan retro affogato church-key. ",
#        :avatar => "https://scontent.ford1-1.fna.fbcdn.net/hphotos-xfa1/v/t1.0-9/12193604_985555058171660_8392627846667778134_n.jpg?oh=fb6abe3148f2e200440885280f135e22&oe=5730A300"
#    )


# categories = ["IT", "Languages", "Cooking", "Sport", "Art","Manufacturing" ,"Communication" ,"Music","Science","Business" ,"Others"]
# categories.each do |category|
#  Category.create(name: category)     
# end

# users = User.all
# skillsset =["Ruby", "C#", "CSS", "JS", "Python", "Java", "SQL"]

# skills.each do |skill|
#       Skill.create!(name: skill, category_id: 1)
# end

# users.each do |user|
#       user.skills.build(name: skillsset[rand(0..skillsset.length)])
#       user.save
# end

# Request.create(sender_id: 1, reciever_id: 2 , skill_id: 1, accepted: true , content: "I will like to tutor with you, if you are available?")




# skills.each do |skill|
#       Skill.create!(name: skill, category_id: 1)
# end
languages =["Spanish", "English", "Polish"]

languages.each do |skill|
      Skill.create!(name: skill, category_id: 2)
end

# users.each do |user|
#       user.skills.build(name: languages[rand(0..languages.length)])
#       user.save
# end