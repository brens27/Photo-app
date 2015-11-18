post '/upload' do
	label = params[:label]
	description = params[:description]
	@photo = Photo.new(params[:photo], params[:label], params[:description])
	@photo.save!

	redirect '/home'
end