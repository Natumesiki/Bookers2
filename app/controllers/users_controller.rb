class UsersController < ApplicationController
   before_action :authenticate_user!, only: [:show,:edit]

 def show
    @user = User.find(params[:id])
    @user = current_user
    @books = @user.books
 end


  def edit
     @user = User.find(params[:id])
      @user = current_user
     @user = User.new
  end


   def create
    @user = User.new(user_params)
    @user.user = current_user
    @user.save
    redirect_to user_path
  end

   def update
    user = User.find(params[:id])
    @user = current_user
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private

  def user_params
     params.require(:user).permit(:name, :profile_image,:introduction)
  end
end
