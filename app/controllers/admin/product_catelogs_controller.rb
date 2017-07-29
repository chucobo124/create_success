class Admin::ProductCatelogsController < Admin::ApplicationController
  before_action :product_catelog, only: [:show, :update, :delete]
  def index
    @admin_product_catelogs = ProductCatelog.all.order('id DESC')
  end

  def new
    @admin_product_catelog = ProductCatelog.new
    @redirect_path = admin_product_catelogs_path
  end

  def show
    @redirect_path = admin_product_catelog_path
  end

  def create
    ProductCatelog.create(product_catelog_params)
    redirect_to admin_product_catelogs_path
  end

  def update
    @admin_product_catelog.update(product_catelog_params)
    redirect_to admin_product_catelogs_path
  end

  private

  def product_catelog
    @admin_product_catelog = ProductCatelog.find(params[:id])
  end

  def product_catelog_params
    params.require(:product_catelog).permit(:title, :description, :file_path)
  end
end
