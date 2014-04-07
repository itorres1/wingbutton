class AddressesController < ApplicationController
  include OrdrinHelper

  def index
    @user = User.find_by(id: params[:user_id])
    @addresses = @user.addresses
  end

  def new
    @address = Address.new
  end

  def create
    email = params[:email]
    nick = params[:nick]
    phone = params[:phone]
    zip = params[:zip]
    addr = params[:addr]
    addr2 = params[:addr2]
    city = params[:city]
    state = params[:state]
    current_password = params[:current_password]
    # create_new_ordrin_address(email, nick, phone, zip, addr, addr2, city, state, current_password)
    @address = Address.new(addr: addr, city: city, zip: zip)
    @address.user = @user
    @address.save
    redirect_to("/wings/#{@address.id}")
  end

  def destroy
    @address.destroy
    redirect_to user_path(@address.user)
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end

  def load_address
    @address = Address.find(params[:id])
  end

end