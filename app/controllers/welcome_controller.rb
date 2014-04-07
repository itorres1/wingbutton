class WelcomeController < ApplicationController
  include OrdrinHelper

  def index
  end

  def wings
    id = params[:id]
    @address = Address.find(id)
    @deliveries = get_delivery_list(@address.addr, @address.city, @address.zip)
    render(:wings)
  end

end