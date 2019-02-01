class BooksController < ApplicationController

  before_action :request # require_user will set the current_user in controllers
  before_action :set_current_user

  def index
    if params[:search]
      @books = Book.search(params[:search])
    else
    @books = Book.all
    end
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
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    end
  end

  def destroy
  end
end

private

def book_params
  params.require(:book).permit(:image, :name, :author, :published_at, :synopsis, :user, :copies)
end
