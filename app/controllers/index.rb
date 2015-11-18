get '/' do
	id = session[:user_id]
	if id
		@user = User.find(id)
	end
  erb :index
end

get '/logout' do
	session.clear
	redirect '/'
end
