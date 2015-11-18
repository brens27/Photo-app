class PhotoUploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick

	process resize_to_fit: [800, 800]

	version :thumb do
		process resize_to_fill: [200, 200]
	end

	def store_dir
		'img'
	end

	def extension_white_list
		%w(jpg jpeg png)
	end

	storage :file

end