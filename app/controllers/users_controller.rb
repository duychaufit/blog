class UsersController < ApplicationController
  def search
  	users = User.all.order('name DESC')
  	if params[:search] == "true"
      if !check_maxlength(params)
        redirect_to list_users_path
        return
      end
      # users = users + User.search_by_name(params[:name]) if params[:name].present? 
      users = User.search(params[:name], params[:address])
    end
  	@users = users.paginate(:page => params[:page], :per_page => 10)
  	# redirect_to list_users_path if params[:page].to_i > @users.total_pages
  end
  def check_maxlength(params)
    return false if params[:id] and params[:id].length > 9
    return false if params[:age] and params[:age].length > 2
    return false if params[:firstname] and params[:firstname].length > 255
    return false if params[:name] and params[:name].length > 255
    return false if params[:address] and params[:address].length > 255
    true
  end



  def detail
  end


end
