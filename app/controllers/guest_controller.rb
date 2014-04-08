class GuestController < ApplicationController
  include OrdrinHelper

  def wings
    id = params[:id]
    @address = Address.find(id)
    @deliveries = get_delivery_list(@address.addr, @address.city, @address.zip)
    render(:wings)
  end

  def menu
    @details = get_restaurant_details(params[:id])
    respond_to do |format|
      format.html { render action: 'menu' }
      format.json { render json: @details }
    end
  end

  def confirmation
  end

  def order
  end

end
