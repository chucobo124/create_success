class Admin::ProductCategoriesController < Admin::ApplicationController
  before_action :product_category, only: [:show, :update, :delete]
  def index
    @product_category = ProductCategory.all
  end

  def show
    @redirect_path = admin_product_category_path(@product_category.id)
  end

  def new
    @redirect_path = admin_product_categories_path
    @product_category = ProductCategory.new
  end

  def create
    if ProductCategory.create(product_category_params)
      redirect_to admin_product_categories_path
    else
      flash[:notice] = 'Something went wrong when update'
      redirect_to admin_product_categories_path
    end
  end

  def update
    if product_category.update(product_category_params)
      redirect_to admin_product_categories_path
    else
      flash[:notice] = 'Something went wrong when update'
      redirect_to admin_product_categories_path
    end
  end

  def destroy
    if product_category.destroy
      redirect_to admin_product_categories_path
    else
      flash[:notice] = 'Something went wrong when delete'
      redirect_to admin_product_categories_path
    end
  end

  private

  def product_category
    @product_category = ProductCategory.find(params[:id])
  end

  def product_category_params
    params.require(:product_category).permit(:title, :description)
  end
end
