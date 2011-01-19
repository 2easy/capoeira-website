class NewsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :authenticate_admin!, :except => [:show, :index]

  def index
    @news = News.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @news }
    end
  end

  def show
    @news_item = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @news_item }
    end
  end

  def new
    @news_item = News.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @news_item }
    end
  end

  def edit
    @news_item = News.find(params[:id])
  end

  def create
    @news_item = News.new(params[:news])

    respond_to do |format|
      if @news_item.save
        format.html { redirect_to(@news_item, :notice => 'News was successfully created.') }
        format.xml  { render :xml => @news_item, :status => :created, :location => @news }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @news_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @news_item = News.find(params[:id])

    respond_to do |format|
      if @news_item.update_attributes(params[:news])
        format.html { redirect_to(@news_item, :notice => 'News was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @news_item.errors, :status => :unprocessable_entity }
      end
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
