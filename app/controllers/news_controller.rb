class NewsController < ApplicationController
  def new
    @news_item = News.new
  end
  def create
    @news_item = News.new(params[:news])
  end
end
