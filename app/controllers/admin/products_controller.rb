class Admin::ProductsController < Admin::ApplicationController
  def show
  end
  def new
    @product= Product.new
  end
  private
  def products
  end
end
