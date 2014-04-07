module OrdrinHelper

  # makes a new call to the api
  def ordrin_api
    Ordrin::APIs.new("hhwe6WYrDqQxJ-DGTCjmg_rQaQJ2OV5Jx6awqwk6zY0", :test)
  end

  #####################
  # RESTAURANT RELATED API CALLS
  #####################

  def delivery_check(rid, addr, city, zip)
    args = { "datetime" => "ASAP", "rid" => rid, "addr" => addr, "city" => city, "zip" => zip }
    ordrin_api.delivery_check(args)
  end

  def get_delivery_list(addr, city, zip)
    args = { "datetime" => "ASAP", "addr" => addr, "city" => city, "zip" => zip }
    ordrin_api.delivery_list(args)
  end

  def get_restaurant_fee(rid, subtotal, tip, addr, city, zip)
    args = { "datetime" => "ASAP", "rid" => rid, "subtotal" => subtotal, "tip" => tip, "addr" => addr, "city" => city, "zip" => zip }
    ordrin_api.fee(args)
  end

  def get_restaurant_details(rid)
    args = { "rid" => rid }
    ordrin_api.restaurant_details(args)
  end

  #####################
  # USER RELATED API CALLS
  #####################

  def create_ordrin_user(email, pw, first_name, last_name)
    args = { "email" => email, "pw" => pw, "first_name" => first_name, "last_name" => last_name}
    ordrin_api.create_account(args)
  end

  def change_ordrin_user_password(email, password, current_password)
    args = { "email" => email, "password" => password, "current_password" => current_password }
    ordrin_api.change_password(args)
  end

  def create_new_ordrin_address(email, nick, phone, zip, addr, addr2, city, state, current_password)
    args = { "email" => email, "nick" => nick, "phone" => phone, "zip" => zip, "addr" => addr, "addr2" => addr2, "city" => city, "state" => state, "current_password" => current_password }
    ordrin_api.create_addr(args)
  end

  def create_new_ordrin_user_credit_card(email, nick, card_number, card_cvc, card_expiry, bill_addr, bill_addr2, bill_city, bill_state, bill_zip, bill_phone, current_password)
    args = { "email" => email, "nick" => nick, "card_number" => card_number, "card_cvc" => card_cvc, "card_expiry" => card_expiry, "bill_addr" => bill_addr, "bill_addr2" => bill_addr2, "bill_city" => bill_city, "bill_state" => bill_state, "bill_state" => bill_state, "bill_zip" => bill_zip, "bill_phone" => bill_phone, "current_password" => current_password }
    ordrin_api.create_cc(args)
  end

  def remove_ordrin_user_address(email, nick, current_password)
    args = { "email" => email, "nick" => nick, "current_password" => current_password }
    ordrin_api.delete_addr(args)
  end

  def remove_ordrin_user_credit_card(email, nick, current_password)
    args = { "email" => email, "nick" => nick, "current_password" => current_password }
    ordrin_api.delete_cc(args)
  end

  def get_ordrin_account_info(email, current_password) 
    args = { "email" => email, "current_password" => current_password }
    ordrin_api.get_account_info(args)
  end

  def get_all_ordrin_user_saved_addresses(email, current_password)
    args = { "email" => email, "current_password" => current_password }
    ordrin_api.get_all_saved_addrs(args)
  end

  def get_all_ordrin_user_saved_credit_cards(email, current_password)
    args = { "email" => email, "current_password" => current_password }
    ordrin_api.get_all_saved_ccs(args)
  end

  def get_ordrin_user_order(email, oid, current_password)
    args = { "email" => email, "oid" => oid, "current_password" => current_password }
    ordrin_api.get_order(args)
  end

  def get_ordrin_user_order_history(email, current_password)
    args = { "email" => email, "current_password" => current_password }
    ordrin_api.get_order_history(args)
  end

  def get_single_ordrin_user_saved_address(email, nick, current_password)
    args = { "email" => email, "nick" => nick, "current_password" => current_password }
    ordrin_api.get_saved_addr(args)
  end

  def get_single_ordrin_user_saved_credit_card(email, nick, current_password)
    args = { "email" => email, "nick" => nick, "current_password" => current_password }
    ordrin_api.get_saved_cc(args)
  end

  #####################
  # RESTAURANT RELATED API CALLS
  #####################

  def make_ordrin_guest_order(rid, email, tray, tip, first_name, last_name, phone, zip, addr, addr2, city, state, card_name, card_number, card_cvc, card_expiry, card_bill_addr, card_bill_addr2, card_bill_city, card_bill_state, card_bill_zip, card_bill_phone)
    args = {
      "rid" => rid,
      "email" => email,
      "tray" => tray,
      "tip" => tip,
      "first_name" => first_name,
      "last_name" => last_name,
      "phone" => phone,
      "zip" => zip,
      "addr" => addr,
      "addr2" => addr2,
      "city" => city,
      "state" => state,
      "card_name" => card_name,
      "card_number" => card_number,
      "card_cvc" => card_cvc,
      "card_expiry" => card_expiry,
      "card_bill_addr" => card_bill_addr,
      "card_bill_addr2" => card_bill_addr2,
      "card_bill_city" => card_bill_city,
      "card_bill_state" => card_bill_state,
      "card_bill_zip" => card_bill_zip,
      "card_bill_phone" => card_bill_phone,
      "delivery_date" => "ASAP"
    }
    ordrin_api.order_guest(args)
  end

  def make_ordrin_user_order((rid, tray, tip, first_name, last_name, email, current_password, phone, zip, addr, addr2, city, state, nick, card_name, card_number, card_nick, card_cvc, card_expiry, card_bill_addr, card_bill_addr2, card_bill_city, card_bill_state, card_bill_zip, card_bill_phone))
    args = {
      "rid" => rid,
      "email" => email,
      "tray" => tray,
      "tip" => tip,
      "first_name" => first_name,
      "last_name" => last_name,
      "phone" => phone,
      "zip" => zip,
      "nick" => nick,
      "addr" => addr,
      "addr2" => addr2,
      "city" => city,
      "state" => state,
      "card_nick" => card_nick,
      "card_name" => card_name,
      "card_number" => card_number,
      "card_cvc" => card_cvc,
      "card_expiry" => card_expiry,
      "card_bill_addr" => card_bill_addr,
      "card_bill_addr2" => card_bill_addr2,
      "card_bill_city" => card_bill_city,
      "card_bill_state" => card_bill_state,
      "card_bill_zip" => card_bill_zip,
      "card_bill_phone" => card_bill_phone,
      "delivery_date" => "ASAP"
    }
  end




end




