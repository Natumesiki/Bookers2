class UsersController < ApplicationController
before_action :authenticate_user!, only:[:edit,:update]
before_action :ensure_correct_user, only:[:edit]

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
     @user = current_user
     @user_up = User.find(params[:id])
  end


   def create
    @user = User.new(user_params)
    @user.user = current_user
    if @user.save
    redirect_to user_path
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

    def ensure_correct_user
        user = User.find(params[:id])
         unless user == current_user
        redirect_to user_path(current_user.id)
     end
   end
