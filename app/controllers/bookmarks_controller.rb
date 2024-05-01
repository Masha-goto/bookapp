class BookmarksController < ApplicationController
	before_action :authenticate_user!

	def create
		book = Book.find(params[:book_id])
		book.bookmarks.create!(user_id: current_user.id)
		redirect_to book_path(book)
	end

	def destroy
		book = Book.find(params[:book_id])
		bookmark = book.bookmarks.find_by!(user_id: current_user.id)
		bookmark.destroy!
		redirect_to book_path(book)
	end
end