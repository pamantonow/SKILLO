# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create!(
       :first_name => "Aleksandra",
       :last_name => "Nowak",
       :email => "anowak@icstars.org",
       :password => "olaolaola",
       :city => "Chicago",
       :state => "IL",
       :zip => "60654",
       :st_num => "351",
       :st_name => "Hubbard St",
       :phone => "7736009632",
       :occupation => "Developer",
       :education => "High-School",
       :description => "I just like to teach.",
       :avatar => "https://scontent.ford1-1.fna.fbcdn.net/hphotos-xfa1/v/t1.0-9/12193604_985555058171660_8392627846667778134_n.jpg?oh=fb6abe3148f2e200440885280f135e22&oe=5730A300"
   )

user.skills.create(name: "Spanish") 

 Request.create(sender_id: 1, reciever_id: 2 , skill_id: 1, accepted: true , content: "I will like to tutor with you, if you are available?")
