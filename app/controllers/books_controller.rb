class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    books.save
    redirect_to '/top'
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private
  def book_params
    params.require(:list).permit(:title, :body)
  end
end


