class BooksController < ApplicationController
before_action :authenticate_user!


  def index
    @book = Book.new
    @book_all = Book.all
      @user = User.find(current_user.id)
    #   @users = User.all
  end

  def show
     @book_new = Book.new
     @book_list = Book.find(params[:id])
        @user = @book_list.user
  end

  def edit
      @book_new = Book.new
       @book = current_user.id
      @book_up = Book.find(params[:id])
      if @book_up.user == current_user
        render "edit"
      else
        redirect_to books_path
      end
  end

   def create
     @book = Book.new(book_params)
       @book.user_id = current_user.id
      if @book.save
     redirect_to book_path(@book.id), notice: "You have created book successfully."
      else
    @user = current_user
    @book_all = Book.all
    render 'books/index'
      end
   end


 def destroy
     @book = Book.find(params[:id])
     @book.destroy
     redirect_to books_path
 end

   def update
    @book_up = Book.find(params[:id])
      @book_up.update(book_params)
       @book = current_user.id
     if @book_up.save
       redirect_to book_path(@book_up.id), notice: "You have updated book successfully."
     else
       render :edit
     end
   end

 private

  def book_params
    params.require(:book).permit(:title,:body,:user_id)
  end
end




