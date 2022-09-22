class BooksController < ApplicationController
 before_action :authenticate_user!, only: [:show,:edit,:index,]

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
     @book = Book.find(params[:id])
     @user = current_user

  end

  def edit
      @book = Book.find(params[:id])
      @user = current_user
  end

   def create
     @book = Book.new(book_params)
      @book.user_id = current_user.id
      @book.save
     redirect_to "/books"
   end

 def destroy
     @book = Book.find(params[:id])
     book = current_user
     @book.delete
     redirect_to book_path(book.id)
 end

   def update
    book = Book.find(params[:id])
    @user = current_user
    book.update(book_params)
    redirect_to book_path(book.id)
  end

 private

  def book_params
    params.require(:book).permit(:title,:body,:Profile_image)
  end
end