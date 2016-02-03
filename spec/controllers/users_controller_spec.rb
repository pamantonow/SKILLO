require 'rails_helper'

 describe UsersController do 

  before :each do
    User.destroy_all
  end

  let!(:user) { User.create!(email: 'bob@gmail.com', password: 'password', first_name: 'bob', last_name: 'bob', city: 'Chicago', state: 'IL', zip: 60658, st_num: 213, st_name: 'W Hubbard', phone: '555-555-5555', occupation: 'Doctor', education: 'Masters', description: 'I like cows.', longitude: 14.43, latitude: 24.5355)}

  # describe "GET #index" do
  #   it 'assigns @categories' do
  #     category = Category.create
  #     get :index
  #     expect(assigns(:categories)).to eq(category)
  #   end
  # end

  describe "GET #new" do
    it 'creates a new user as @user' do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end


  describe "POST #create" do
    before :each do
      @bob = {user: {email: 'bob1@gmail.com', password: 'password', first_name: 'bob', last_name: 'bob', city: 'Chicago', state: 'IL', zip: 60658, st_num: 213, st_name: 'W Hubbard', phone: '555-555-5555', occupation: 'Doctor', education: 'Masters', description: 'I like cows.', longitude: 14.43, latitude: 24.5355}}
      post :create, @bob
    end

    context "when valid params are passed" do
      it 'creates a new User' do
        expect(assigns(:user)).to be_a(User)
       end
    end

    it "redirects to the user's profile" do
      bob = User.find_by(email: "bob1@gmail.com")
      expect(response).to redirect_to(user_path(bob))
      # expect(response).to render_template(:show)
    end
  end

  context 'when invalid params are passed' do
    it 'assigns a new user but does not save it' do
      user = {user: {email: ""}}
      post :create, user
      expect(assigns(:user).id).to eq(nil)
    end
  

    it 're-render the new template' do
      user = {user: {email: ""}}
      post :create, user 
      expect(response).to render_template(:new)
    end
  end

  # describe 'GET #show' do
  #   it 'assigns the requested user as @user' do
  #     puts "user id: #{user.id}"
  #     get :show, { id: user.id }
  #     expect(assigns(:user)).to eq(user)
  #     p response
  #   end


  # it 'assigns @request as a new request but does not save it' do
  #     request = Request.new
  #     get :show, { id: user.id }
  #     expect(assigns(:request)).to eq(request)
  #   end
  # end
  
end
