get '/sign_in' do
	erb :index
end

get '/sign_up' do
	erb :sign_up
end

post '/sign_up' do
	username = params[:username]
	name = params[:name]
	email = params[:email]
	password = params[:password]

	@user = User.new(username: username, name: name, email: email, password: password)
	
	if @user.save
		session[:user_id] = @user.id
		redirect '/home'
	else
		redirect '/sign_up'
	end
end

get '/profile' do
	id = session[:user_id]
	@user = User.find(id)
	erb :profile
end
