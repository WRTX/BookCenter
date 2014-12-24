class BooksController < ApplicationController
  def index
    @books = Book.where(available: true) + Book.where(available: false)

    if params[:codes]
      @showqrc = true
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])

    if params[:return]
      @book.returned
      redirect_to root_path
    else
      @name = params[:name].strip
      if @name and @name != ""
        borrower = Borrower.find_or_create_by(name: @name)
        @book.transfer_to(borrower)
        redirect_to root_path
      else
        @error = "No name"
        render "show"
      end
    end
  end

end
