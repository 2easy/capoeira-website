class ContactsController < ApplicationController
  before_filter :authenticate_admin!, :except => :show

  def show
    @contact = Contact.first
  end

  def new
  end
  def create
  end
  def update
  end
  def edit
    @contact = Contact.first
  end
  def update
    @contact = Contact.first
    @contact.update_attributes(params[:contact])

    redirect_to @contact
  end
end
