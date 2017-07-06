class Admin::FaqCategoryController < Admin::ApplicationController
  include Imageable
  def index
    @admin_faq_category = FaqCategory.all
  end

  def show
    @redirect_path = admin_faq_category_path(faq_category.id)
  end

  def new
    @redirect_path = admin_faq_category_index_path
    @admin_faq_category = FaqCategory.new
  end

  def create
    if faq_category = FaqCategory.create(faq_category_params)
      if picture_params(:faq_category).present?
        save_image faq_category, picture_params(:faq_category)
      end
      redirect_to admin_faq_category_index_path
    else
      flash[:notice] = 'Something went wrong when update'
      redirect_to admin_faq_category_index_path
    end
  end

  def update
    if faq_category.update(faq_category_params)
      if picture_params(:faq_category).present?
        save_image faq_category, picture_params(:faq_category)
      end
      redirect_to admin_faq_category_index_path
    else
      flash[:notice] = 'Something went wrong when update'
      redirect_to admin_faq_category_index_path
    end
  end

  def destroy
    if faq_category.destroy
      redirect_to admin_faq_category_index_path
    else
      flash[:notice] = 'Something went wrong when delete'
      redirect_to admin_faq_category_index_path
    end
  end

  private

  def faq_category
    @admin_faq_category = FaqCategory.find(params[:id])
  end

  def faq_category_params
    params.require(:faq_category).permit(:title, :description)
  end
end
