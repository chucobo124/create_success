class Admin::NewsController < Admin::ApplicationController
  include Imageable
  def index
    @admin_news = News.all
  end

  def show
    @redirect_path = admin_news_path(news.id)
  end

  def new
    @redirect_path = admin_news_index_path
    @admin_news = News.new
  end

  def create
    if news= News.create(news_params)
      if picture_params(:news).present?
          save_image news, picture_params(:news)
      end
      redirect_to admin_news_index_path
    else
      flash[:notice] = 'Something went wrong when update'
      redirect_to admin_news_index_path
    end
  end

  def update
    if news.update(news_params)
      if picture_params(:news).present?
          save_image news, picture_params(:news)
      end
      redirect_to admin_news_index_path
    else
      flash[:notice] = 'Something went wrong when update'
      redirect_to admin_news_index_path
    end
  end

  def destroy
    if news.destroy
      redirect_to admin_news_index_path
    else
      flash[:notice] = 'Something went wrong when delete'
      redirect_to admin_news_index_path
    end
  end

  private

  def news
    @admin_news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title, :description)
  end
end
