class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

private

def book_params
  params.require(:book).permit(:name, :author, :published_at, :synopsis, :user, :checkouts[])
end
