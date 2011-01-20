class NewsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :authenticate_admin!, :except => [:show, :index]

  def index
    @news = News.all
  end

  def show
    @news_item = News.find(params[:id])
  end

  def new
    @news_item = News.new
  end

  def edit
    @news_item = News.find(params[:id])
  end

  def create
    @news_item = News.new(params[:news])

    if @news_item.save
      redirect_to(@news_item, :notice => 'News was successfully created.')
    else
      format.html { render :action => "new" }
    end
  end

  def update
    @news_item = News.find(params[:id])

    if @news_item.update_attributes(params[:news])
      format.html { redirect_to(@news_item, :notice => 'News was successfully updated.') }
    else
      format.html { render :action => "edit" }
    end
  end

  def destroy
    @news_item = News.find(params[:id])
    if @news_item
      @news_item.destroy
    else
      redirect_to root_url, :notice => "No such news item"
    end

    respond_to do |format|
      format.html { redirect_to(news_index_url) }
      format.xml  { head :ok }
    end
  end
end
