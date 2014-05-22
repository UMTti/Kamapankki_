class UsersController < ApplicationController

  def new
  	  if current_user == nil
  	  	@user = User.new
      else
      	redirect_to root_url
      end

  end

  def show
      @user = User.find(params[:id])
  end


  def create
      @user = User.new(user_params)
      if @user.save
         redirect_to root_url, :notice => "Signed up!"
      else
          render "new"
      end
  end

  def own_page
  	  @user = current_user
      if @user =! nil
      	@user = current_user
      else
      	redirect_to root_url
      end
  end

   def user_params
      # It's mandatory to specify the nested attributes that should be whitelisted.
      # If you use `permit` with just the key that points to the nested attributes hash,
      # it will return an empty hash.
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
   end

end
