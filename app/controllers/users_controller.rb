class UsersController < ApplicationController
  before_action :check_for_login, only: [:show]

  def new
    @highlighted = "create account"
    @user = User.new
  end
  
  def create
    user = User.new user_params
    if user.save
      Pseudouser.create :user_id => user.id
      session[:user_id] = user.id
      redirect_to root_path # you can redirect wherever you want
    else
      redirect_to new_user_path # show them the form again so they can try again
    end
  end
  
  def show
    @highlighted = "library"
    @fonts = hand_written
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
