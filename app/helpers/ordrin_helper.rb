module OrdrinHelper

  # makes a new call to the api
  def api
    Ordrin::APIs.new("hhwe6WYrDqQxJ-DGTCjmg_rQaQJ2OV5Jx6awqwk6zY0", :test)
  end

  # RESTAURANT RELATED API CALLS

  def get_restaurant_details(id)
    args = { "rid" => id }
    @details = api.restaurant_details(args)
  end

  # USER RELATED API CALLS

  def create_ordrin_user
    args = { "email" => email, "pw" => pw, "first_name" => first_name, "last_name" => last_name}
    @new_user = api.create_account(args)
  end

  



end