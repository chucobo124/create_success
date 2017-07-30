class FaqCategoryController < ApplicationController
  def index
    @faq_articles = Faq.where(faq_category_id: params[:category_id])
    @category_name = FaqCategory.find(params[:category_id]).title
  end
end
