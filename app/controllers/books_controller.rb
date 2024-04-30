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
    @book = Book.new(book_params)
    if @book.save
			redirect_to book_path(@book), notice: '保存できたよ'
    else
			flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :content)
  end
end