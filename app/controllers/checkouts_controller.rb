class CheckoutsController < ApplicationController

  def new
    @checkout = Checkout.new
  end
  def create
    @book = Book.find(params[:book_id])
    @checkout = Checkout.new(checkout_params)
    @checkout.book_id = @book.id
    @checkout.user_id = current_user.id
    @checkout.checkout_date = Time.now
    @checkout.due_date = Time.now + (2*7*24*60*60)
    if @checkout.save!
      redirect_to @book, notice: "Thanks for checking out #{@book.name}"
    else
      @book
    end
  end
end

private

def checkout_params
  params.require(:checkout).permit(:checkout_date, :due_date, :user_id, :book_id)
end
