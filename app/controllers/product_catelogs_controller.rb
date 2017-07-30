class ProductCatelogsController < ApplicationController
  def index
    params[:page_index] = 1
    @product_catelogs = product_catelogs
  end

  def display_more
    @response = JSON.parse(product_catelogs.to_json).map do |product_catelog|
      product_catelog_obj = ProductCatelog.find(product_catelog['id'])
      product_catelog.merge(picture_url: product_catelog_obj.pictures
        .try(:first).try(:asset).try(:thumb).try(:url))
    end
    render json: @response << [{ next: product_catelogs.next_page }]
  end

  def category_example
  end

  def product_catelogs
    ProductCatelog.page(params[:page_index]).per(8)
  end
end
