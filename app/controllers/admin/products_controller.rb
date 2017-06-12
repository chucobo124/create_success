class Admin::ProductsController < Admin::ApplicationController
  include Imageable
  def show
  end

  def new
    @product = Product.new
  end

  def create
    prepare_product = params_product
    product= Product.create(prepare_product)
    if pictures_params(:product).present?
      pictures_params(:product).each do |image|
        save_images(product.pictures.create, image)
      end
    end
    redirect_to action: 'show'
  end

  private

  def params_product
    params.require(:product).permit(:name, :sku, :description)
  end
end
