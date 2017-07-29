class Admin::FaqController < Admin::ApplicationController
  before_action :faq, only: [:show, :update, :delete]
  def index
    @faqs = Faq.where(faq_category_id: params[:faq_category_id]).order('id DESC')
  end

  def new
    @redirect_path = admin_faq_category_faq_index_path(params[:faq_category_id])
    @faq = Faq.new
  end

  def show
    @redirect_path = admin_faq_category_faq_path(params[:faq_category_id], params[:id])
  end

  def create
    Faq.create(faq_params)
    redirect_to admin_faq_category_faq_index_path(params[:faq_category_id])
  end

  private

  def faq
    @faq = Faq.find(params[:faq_category_id], params[:id])
  end

  def faq_params
    params.require(:faq).permit(:title, :description).merge(faq_category_id: params[:faq_category_id])
  end
end
