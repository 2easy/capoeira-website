class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
    @news = News.all
  end
end
