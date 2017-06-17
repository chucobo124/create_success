class Admin::ProductsController < Admin::ApplicationController
  include Imageable
  before_action :product, only: [:show, :update, :delete]

  def index
    @admin_products = Product.all
  end

  def show
    @redirect_path = admin_product_path(product.id)
  end

  def new
    @redirect_path = admin_products_path
    @admin_product = Product.new
  end

  def create
    product = Product.create(product_params)
    if pictures_params(:product).present?
      pictures_params(:product).each do |image|
        save_images product.pictures.create, image
      end
    end
    if product.product_detail.present?
      product.product_detail.update(product_detail_params)
    else
      product.product_detail = ProductDetail.new(product_detail_params)
    end
    redirect_to admin_products_path
  end

  def update
    if pictures_params(:product).present?
      pictures_params(:product).each do |image|
        save_images @admin_product.pictures.create, image
      end
    end
    if @admin_product.product_detail.present?
      @admin_product.product_detail.update(product_detail_params)
    else
      @admin_product.product_detail = ProductDetail.new(product_detail_params)
    end
    redirect_to admin_products_path
  end

  def destroy
    product.destroy
    redirect_to admin_products_path
  end

  private

  def product
    @admin_product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :sku, :description)
  end

  def product_detail_params
    return nil unless params[:product][:product_detail].present?
    params.require(:product).require(:product_detail).permit(
      :maximum_diameter_grab_items,
      :distance_between_centers,
      :swing_over_bed,
      :swing_over_cross_slide,
      :taper_of_spindle_bore,
      :spindle_bore,
      :step_of_spindle_speeds,
      :range_of_spindle_speeds,
      :range_of_inch_threads,
      :range_of_metric_theads,
      :top_slide_travel,
      :cross_slide_travel,
      :tailstock_quil_travel,
      :taper_of_tailstock_quill,
      :motor,
      :overall_dimension,
      :net_weight,
      :other_data,
      :created_at,
      :updated_at,
      :product_id
    )
  end
end
