class UsersController < ApplicationController
  before_action :check_for_login

  def new
    @user = User.new
  end

  def create
    user = User.new user_params
    if user.save
      session[:user_id] = @user.id
      redirect_to root_path # you can redirect wherever you want
    else
      render :new # show them the form again so they can try again
    end
  end

  def show
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
