class UsersController < ApplicationController


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
   if user.update(user_params)
    redirect_to user_path(user.id), notice: "You have updated user successfully."
  else
   render :show
  end
 end

  private

  def user_params
     params.require(:user).permit(:name, :profile_image,:introduction)
  end
end