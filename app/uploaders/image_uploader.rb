class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :thumbnail do
    eager
    resize_to_fill(150,200)
    cloudinary_transformation :quality => 80
  end
end
