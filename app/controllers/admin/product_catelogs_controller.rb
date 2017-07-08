class Admin::ProductCatelogsController < Admin::ApplicationController
  def index
    @admin_product_catelogs = ProductCatelog.all
  end

  def new
    @admin_product_catelog = ProductCatelog.new
    @redirect_path = admin_product_catelogs_path
  end

  def create
    ProductCatelog.create(product_catelog_params)
    redirect_to admin_product_catelogs_path
  end

  private

  def product_catelog_params
    params.require(:product_catelog).permit(:title, :description, :file_path)
  end
end
