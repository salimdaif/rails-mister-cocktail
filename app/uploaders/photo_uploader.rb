# encoding: utf-8
class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :standard do
    cloudinary_transformation radius: 20,
      width: 350, height:350, gravity: :center, crop: :fill
  end

  version :thumb do
    cloudinary_transformation radius: 20,
      width: 150, height: 150, crop: :thumb, gravity: :center
  end
end
