class BooksController < ApplicationController


  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
     @book = Book.find(params[:id])
     @user  = @book.user
     @book_new = Book.new
  end

  def edit
      @book = Book.find(params[:id])
      @book.user_id = current_user.id

  end

   def create
     book = Book.new(book_params)
      book.user = current_user
      @user = current_user.id
      if book.save
     redirect_to book_path(book.id), notice: "You have created book successfully."
   else
    render :show_book
   end
end


 def destroy
     @book = Book.find(params[:id])
     book = current_user
     @book.destroy
     redirect_to books_path
 end

   def update
    book = Book.find(params[:id])
       user = current_user.id
     #@book.user = current_user.id
   if  book.update(book_params)
    redirect_to book_path(book.id), notice: "You have updated book successfully."
  else
    render :show_book
   end
  end

 private

  def book_params
    params.require(:book).permit(:title,:body,:profile_image)
  end
end