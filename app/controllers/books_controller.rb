class BooksController < ApplicationController
before_action :authenticate_user!, only:[:edit,:update,:destroy]

  def index
    @book = Book.new
    @books = Book.all
     @user = current_user

  end

  def show
     @book = Book.find(params[:id])
       @user = @book.user
       # @book = current_user.id
      @book_new = Book.new
  end

  def edit
      @book = Book.new
       @book = current_user.id
      @book_up = Book.find(params[:id])
  end

   def create
     @book = Book.new(book_params)
       @book.user_id = current_user.id
      if @book.save
     redirect_to book_path(@book.id), notice: "You have created book successfully."
   else
    render :index
   end
end


 def destroy
     @book = Book.find(params[:id])
     @book = current_user
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
    params.require(:book).permit(:title,:body,:profile_image)
  end
end