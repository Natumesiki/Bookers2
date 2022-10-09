class UsersController < ApplicationController
before_action :authenticate_user!
# before_action :correct_user, only: [:edit,:update]

def index
 @users = User.all
  @user = current_user
 @book = Book.new
end

 def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
 end


  def edit
     @user = current_user
     @user_up = User.find(params[:id])
    if @user_up == current_user
       render "edit"
    else
      redirect_to user_path(@user.id)
    end
  end

   def create
    @user = User.new(user_params)
    @user.user = current_user
    if @user.save
    redirect_to user_path(user.id)
    else
    render :show
    end
   end

   def update
    @user_up = User.find(params[:id])
    @user_up.update(user_params)
     user = current_user
    if  @user_up.save
    redirect_to user_path(user.id), notice: "You have updated user successfully."
    else
   render :edit
    end
   end


  private

  def user_params
     params.require(:user).permit(:name, :profile_image,:introduction)
  end
end

# def correct_user
#  user = User.find(params[:id])
#  if current_user != user
#   redirect_to user_path
#  else
#   render :show
#  end
# end

