class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @authentications }
    end
  end

  def create
    @authentication = Authentication.new(params[:authentication])

    respond_to do |format|
      if @authentication.save
        format.html { redirect_to(@authentication, :notice => 'Authentication was successfully created.') }
        format.xml  { render :xml => @authentication, :status => :created, :location => @authentication }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @authentication.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy

    respond_to do |format|
      format.html { redirect_to(authentications_url) }
      format.xml  { head :ok }
    end
  end
end
