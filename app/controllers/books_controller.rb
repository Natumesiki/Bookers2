class BooksController < ApplicationController

  def index
    @book = Book.new
    @book = Book.all
  end

  def show
     @book = Book.find(params[:id])

  end


   def create
     book = Book.new(book_params)
     book.save
     redirect_to '/books'
    #  @book.user_id = current_user.id
#   if @book.save
#      redirect_to book_path
#   else
#      render :index
   end

  private

  def book_params
    params.require(:book).permit(:title,:body,:image)
  end

end
