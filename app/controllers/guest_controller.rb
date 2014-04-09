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

  def order
    @order = Order.create(order_string: params[:orderString])
    render :order
  end

  def final
    rid = params[:rid]
    tray = params[:tray]
    tip = params[:tip] 
    delivery_date = "ASAP" 
    first_name = params[:first_name]
    last_name = params[:last_name] 
    addr = params[:addr]
    city = params[:city]
    state = params[:state] 
    zip = params[:zip]
    phone = params[:phone] 
    em = params[:em]
    card_name = params[:card_name]
    card_number = params[:card_number]
    card_cvc = params[:card_cvc]
    card_expiry = params[:card_expiry]
    card_bill_addr = params[:card_bill_addr] 
    card_bill_city = params[:card_bill_city] 
    card_bill_state = params[:card_bill_state] 
    card_bill_zip = params[:card_bill_zip] 
    card_bill_phone = params[:card_bill_phone]

    make_ordrin_guest_order(rid, tray, tip, delivery_date, first_name, last_name, addr, city, state, zip, phone, em, card_name, card_number, card_cvc, card_expiry, card_bill_addr, card_bill_city, card_bill_state, card_bill_zip, card_bill_phone)
  end

end
