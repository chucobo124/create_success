module Imageable
  extend ActiveSupport::Concern
  def pictures_params(main_key)
    return nil unless params[main_key][:pictures].present?
    images = params.require(main_key).require(:pictures)
    images.values.map { |image| { asset: image } }
  end

  def save_images(klass, picture_object)
    klass.asset = picture_object[:asset]
    klass.save
  end
end
