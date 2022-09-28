class UsersController < ApplicationController
   before_action :authenticate_user!, only: [:show,:edit]


def index
 @users = User.all
 @user = current_user
end

 def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
 end


  def edit
     @user = User.find(params[:id])
  end


   def create
    @user = User.new(user_params)
    @user.user = current_user
    @user.save
    redirect_to user_path
  end

   def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private

  def user_params
     params.require(:user).permit(:name, :profile_image,:introduction)
  end
end
