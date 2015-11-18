get '/home' do
	id = session[:user_id]
	@user = User.find(id)
	@photos = Photo.all
	erb :home	
end

post '/home' do 
	email = params[:email]
	password = params[:password]
	@user = User.authenticate(email, password)
	if @user
		id = @user.id
		session[:user_id] = @user.id
		redirect '/home'
	end

	redirect "/"
end