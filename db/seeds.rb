a = User.create(
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

 a.skills.create(name: "Spanish")

