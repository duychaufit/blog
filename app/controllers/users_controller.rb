class UsersController < ApplicationController
  before_action :set_user, only: [:detail, :update]

  def search
  	users = User.joins(:members).includes(:members).all.order('name DESC')
  	if params[:search] == "true"
      if !check_maxlength(params)
        redirect_to list_users_path
        return
      end
      users = users.search_by_name(params[:name]) if params[:name].present? 
      users = users.search_by_address(params[:address]) if params[:address].present? 
    end
  	@users = users.paginate(:page => params[:page], :per_page => 10)
  	redirect_to list_users_path if params[:page].to_i > @users.total_pages
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

  def update
    if request.post?
      @user.assign_attributes(user_params)
      if @user.valid?
        @user.update(user_params)
        @user.save
        
        redirect_to detail_users_path(@user)  
      else
        @user.errors
        render 'detail'
      end
    end
  end

  private
	  def set_user
	  	@user = User.find_by(id: params[:id])
      render '404' if !@user
	  end

    def user_params
      params.require(:user).permit(
          :firstname, :age, :name,
          members_attributes: [:user_id, :id, :address, :full_name]
          )
    end


end
