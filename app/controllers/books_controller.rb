class BooksController < ApplicationController
	before_action :set_book, only: [:show]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		@books = Book.all
	end

	def show
	end

	def new
		@book = current_user.books.build
	end

	def create
		@book = current_user.books.build(book_params)
		if @book.save
			redirect_to book_path(@book), notice: '保存できました'
		else
			flash.now[:error] = '保存に失敗しました'
			render :new
		end
	end


	def edit
		@book = current_user.books.find(params[:id])
	end

	def update
		@book = current_user.books.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book), notice: '更新できました'
		else
			flash.now[:error] = '更新できませんでした'
			render :edit
		end
	end

	def destroy
    book = current_user.books.find(params[:id])
    book.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

	private
	def book_params
		params.require(:book).permit(:title, :content)
	end

	def set_book
		@book = Book.find(params[:id])
	end
end