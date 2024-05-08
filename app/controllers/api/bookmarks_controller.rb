class Api::BookmarksController < Api::ApplicationController
	before_action :authenticate_user!
	def show
		book = Book.find(params[:book_id])
		book_status = current_user.has_bookmarked?(book)
		render json: { hasBookmarked: book_status }
	end

	def create
		book = Book.find(params[:book_id])
		book.bookmarks.create!(user_id: current_user.id)
		render json: { status: 'ok' }
	end

	def destroy
		book = Book.find(params[:book_id])
		bookmark = book.bookmarks.find_by!(user_id: current_user.id)
		bookmark.destroy!
		render json: { status: 'ok' }
	end
end