module Imageable
  extend ActiveSupport::Concern
  def pictures_params(main_key)
    return nil unless params[main_key][:pictures].present?
    images = params.require(main_key).require(:pictures)
    images.values.map { |image| { asset: image } }
  end

  def picture_params(main_key)
    return nil unless params[main_key][:picture].present?
    image = params.require(main_key).require(:picture)
    image.values.first
  end

  def save_image(klass, picture_object)
    if klass.picture.present?
      klass.picture.asset = picture_object
    else
      klass.picture= Picture.new(asset: picture_object)
    end
    klass.save
  end

  def save_images(klass, picture_object)
    klass.asset = picture_object[:asset]
    klass.save
  end
end
