class BookmarklistsController < ApplicationController
	before_action :authenticate_user!

	def index
		@books = current_user.bookmarklists
	end
end