class BooksController < ApplicationController
  def new
    @book = Book.new
  end

def create
   @book = Book.new(book_params)
  if @book.save
   redirect_to book_path(@book)
   flash[:notice] = "Book was successfully created."
  else
   @books = Book.all
   render :index
  end
end


  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
     book = Book.find(params[:id])
     book.destroy
     redirect_to books_path
  end

def update
    @book = Book.find(params[:id])
    @book.update(book_params)
  if @book.save
    redirect_to book_path(@book.id)
    flash[:notice] = "Book was successfully updated."
  else
   render :edit
  end
end



  private
     def book_params
     params.require(:book).permit(:title, :body)
     end
end